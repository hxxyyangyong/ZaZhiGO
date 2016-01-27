//
//  GLDBCache.m
//  GLCommon
//
//  Created by yangyong on 14-6-16.
//  Copyright (c) 2014年 gainline. All rights reserved.
//

#import "GLDBCache.h"

#define D_DBDEFAULTSIZE 12288
#define D_CacheTableName     @"CacheTable"

@interface GLDBCache()
{
    sqlite3 *_db;
    NSString *_tableName;
    dispatch_queue_t _persistenceQueue;
    NSString *_cachePath;
}
- (void)openDB;
- (void)closeDB;
- (BOOL)createDBCacheTable;

@end

@implementation GLDBCache
- (id)initWithStorage:(Storage *)storage
                 name:(NSString *)name
{
    self = [super initWithStorage:storage name:name];
    if (self) {
        [self openDB];
        _persistenceQueue = dispatch_queue_create("Cm.persistence.queue", DISPATCH_QUEUE_SERIAL);
        
    }
    return self;
}

- (void)dealloc
{
    [self closeDB];
}


- (void)executeBlockInPersistenceQueue:(dispatch_block_t)block {
    if (dispatch_get_current_queue() == _persistenceQueue) {
        block();
    }else {
        dispatch_sync(_persistenceQueue, block);
    }
}

- (void)openDB
{
	NSString *filePath = [self.storage libraryPathWithRelativePath:[self.name stringByAppendingPathExtension:@"sqlite"]];
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        if (sqlite3_open([filePath UTF8String], &_db) == SQLITE_OK) {
            [NSFileManager addSkipBackupAttributeToItemAtURL:[NSURL URLWithString:filePath]];
            if (![self createDBCacheTable]) {
                @throw [[NSException alloc] initWithName:[NSString stringWithFormat:@"create cache %@.sqlite's CacheTable",self.name] reason:@"failed" userInfo:nil];
            }
        }
        else {
            @throw [[NSException alloc] initWithName:@"open DBCache db failed!" reason:@"failed" userInfo:nil];
        }
    }else{
        sqlite3_open([filePath UTF8String], &_db);
    }
}

- (void)closeDB
{
	sqlite3_close(_db);
}


- (BOOL)createDBCacheTable
{
	NSString *strSql = @"CREATE TABLE IF NOT EXISTS CacheTable (key text PRIMARY KEY,\
    content blob,\
    modifiedTime double,\
    createTime double\
    )";
    
	// prepare statement
	sqlite3_stmt *statement = nil;
	if (sqlite3_prepare_v2(_db, [strSql UTF8String], -1, &statement, NULL) != SQLITE_OK) {
		return NO;
	}
	// execute
	int result = sqlite3_step(statement);
	sqlite3_finalize(statement);
	if (result != SQLITE_DONE) {
		return NO;
	}
	return YES;
}

- (BOOL)hasDataForKey:(NSString *)key
{
    __block BOOL isExist = NO;
    [self executeBlockInPersistenceQueue:^{
        isExist = [self dispatchHasDataForKey:key];
    }];
    return isExist;
}


- (BOOL)dispatchHasDataForKey:(NSString *)key
{
    BOOL isExist = NO;
    NSString *strSql = @"SELECT (key) FROM CacheTable WHERE key = ?";
    // prepare statement
    sqlite3_stmt *statement = nil;
    if (sqlite3_prepare_v2(_db, [strSql UTF8String], -1, &statement, NULL) != SQLITE_OK) {
        return isExist;
    }
    //bind
    sqlite3_bind_text(statement, 1, [key UTF8String], -1, SQLITE_TRANSIENT);
    // execute statement
    if (sqlite3_step(statement) == SQLITE_ROW) {
        isExist = YES;
    }
    sqlite3_finalize(statement);
    return isExist;
}

- (NSData *)dataForKey:(NSString *)key
{
    __block     NSData *ret = nil;
    [self executeBlockInPersistenceQueue:^{
        ret = [self dataForKeyTT:key];
    }];
    return ret;
}


- (NSData *)dataForKeyTT:(NSString *)key
{
    NSString *strSql = @"SELECT (content) FROM CacheTable WHERE key = ?";
    NSData *ret = nil;
    
	// prepare statement
	sqlite3_stmt *statement = nil;
	if (sqlite3_prepare_v2(_db, [strSql UTF8String], -1, &statement, NULL) != SQLITE_OK) {
        return ret;
	}
    
    //bind
    sqlite3_bind_text(statement, 1, [key UTF8String], -1, SQLITE_TRANSIENT);
	// execute statement
	while (sqlite3_step(statement) == SQLITE_ROW) {
		const void *content = (void*)sqlite3_column_blob(statement, 0);
		if (content) {
			int size = sqlite3_column_bytes(statement, 0);
			ret = [[NSData alloc] initWithBytes:content length:size];
            break;
		}
	}
	sqlite3_finalize(statement);
	
	return ret;
}



- (BOOL)addData:(NSData *)data forKey:(NSString *)key
{
    BOOL ret = NO;
    NSString *strSql = @"INSERT INTO CacheTable (key, content, modifiedTime, createTime) VALUES(?, ?, ?, ?)";
	
	// prepare statement
	sqlite3_stmt *statement = nil;
	if (sqlite3_prepare_v2(_db, [strSql UTF8String], -1, &statement, NULL) != SQLITE_OK) {
		return ret;
	}
	
	// bind
	sqlite3_bind_text(statement, 1, [key UTF8String], -1, SQLITE_TRANSIENT);
	
	if (data != nil) {
		const void *dataBytes = [data bytes];
		NSInteger dataLegth = [data length];
		sqlite3_bind_blob(statement, 2, dataBytes, dataLegth, SQLITE_TRANSIENT);
	}
    
    NSTimeInterval nowTimeInterval = [[NSDate date] timeIntervalSince1970];
    sqlite3_bind_double(statement, 3, nowTimeInterval);
    sqlite3_bind_double(statement, 4, nowTimeInterval);
    
	// execute
	int result = sqlite3_step(statement);
	
	// delete statement
	sqlite3_finalize(statement);
    
	if (result == SQLITE_ERROR) {
        ret = NO;
	} else {
        ret = YES;
    }
    
	return ret;
}

- (BOOL)updateData:(NSData *)data forKey:(NSString *)key
{
    BOOL ret = NO;
    NSString *strSql = @"UPDATE CacheTable SET content = ?, modifiedTime = ? WHERE key = ?";
    // prepare statement
    sqlite3_stmt *statement = nil;
    if (sqlite3_prepare_v2(_db, [strSql UTF8String], -1, &statement, NULL) != SQLITE_OK) {
        return ret;
    }
    // bind
	if (data != nil) {
		const void *dataBytes = [data bytes];
		NSInteger dataLegth = [data length];
		sqlite3_bind_blob(statement, 1, dataBytes, dataLegth, SQLITE_TRANSIENT);
	}
    NSTimeInterval modifiedTime = [[NSDate date] timeIntervalSince1970];
    sqlite3_bind_double(statement, 2, modifiedTime);
    sqlite3_bind_text(statement, 3, [key UTF8String], -1, SQLITE_TRANSIENT);
    
    // execute
    int result = sqlite3_step(statement);
    sqlite3_finalize(statement);
//    BCLOG_D_AREA(E_LOGAREA_Infrastructure, @"strsql = %@", strSql);
    if (result != SQLITE_OK) {
        ret = NO;
    }else{
        return YES;
    }
    return ret;
}

- (BOOL)addOrUpdateString:(NSString *)string
                   forKey:(NSString *)key
{
    return  [self addOrUpdateData:[string dataUsingEncoding:NSUTF8StringEncoding] forKey:key];
}

- (BOOL)addOrUpdateData:(NSData *)data
                 forKey:(NSString *)key
{
    return [self updateData:data forKey:key] ? YES : [self addData:data forKey:key];
}

- (NSString *)getStringForKey:(NSString *)key
{
    NSString *string = [[NSString alloc] initWithData:[self getDataForkey:key] encoding:NSUTF8StringEncoding];
    return string;
}
- (NSData *)getDataForkey:(NSString *)key
{
    return [self dataForKey:key];
}

- (BOOL)removeForKey:(NSString*)key
{
    BOOL ret = NO;
    NSString *strSql = @"DELETE FROM CacheTable WHERE key = ?";
    // prepare statement
    sqlite3_stmt *statement = nil;
    if (sqlite3_prepare_v2(_db, [strSql UTF8String], -1, &statement, NULL) != SQLITE_OK) {
        return ret;
    }
    // bind
	sqlite3_bind_text(statement, 1, [key UTF8String], -1, SQLITE_TRANSIENT);
    // execute
    int result = sqlite3_step(statement);
    sqlite3_finalize(statement);
    if (result == SQLITE_ERROR) {
        ret = NO;
    } else {
        ret = YES;
    }
    return ret;
}
- (BOOL)clear
{
    BOOL ret = NO;
    [self closeDB];
    NSString *cachePath = [self.storage libraryPathWithRelativePath:[self.name stringByAppendingPathExtension:@"sqlite"]];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSError *error;
    if (fileManager) {
        [fileManager removeItemAtPath:cachePath error:&error];
    }
    if (error) {
        ret = NO;
    } else {
        [self openDB];
        ret = YES;
    }
    return ret;
}

- (unsigned long long)cacheSize
{
    NSString *cachePath = [self.storage libraryPathWithRelativePath:[self.name stringByAppendingPathExtension:@"sqlite"]];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:cachePath])
    {
        return 0;
    }
    unsigned long long dbSize = [StorageUtility fileSizeAtPath:cachePath] - D_DBDEFAULTSIZE;
    dbSize = dbSize ? dbSize : 0;
    return dbSize;
}



@end