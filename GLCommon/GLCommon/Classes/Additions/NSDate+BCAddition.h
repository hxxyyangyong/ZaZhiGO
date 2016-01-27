//
//  NSDate+BCAddition.h
//  BCCoreLibrary
//
//  Created by Ji Will on 11/26/12.
//  Copyright (c) 2012 iBrand. All rights reserved.
//

#import <Foundation/Foundation.h>


#define BC_MINUTE 60
#define BC_HOUR   (60 * BC_MINUTE)
#define BC_DAY    (24 * BC_HOUR)
#define BC_5_DAYS (5 * BC_DAY)
#define BC_WEEK   (7 * BC_DAY)
#define BC_MONTH  (30.5 * BC_DAY)
#define BC_YEAR   (365 * BC_DAY)
#define BC_TIMEMAX (1.0/0.0)
#define D_NSDate_Default_Format @"yyyy-MM-dd HH:mm:ss"
@interface NSDate (BCAddition)
/**
 * Returns the current date with the time set to midnight.
 */
+ (NSDate*)dateWithToday;

/**
 * Returns a copy of the date with the time set to midnight on the same day.
 */
- (NSDate*)dateAtMidnight;


+ (NSDate *)dateWithString:(NSString *)dateString inFormat:(NSString *)formatString;
/**
 * Formats the date with 'h:mm a' or the localized equivalent.
 */
- (NSString*)formatTime;

/**
 * Formats the date with 'EEEE, LLLL d, YYYY' or the localized equivalent.
 */
- (NSString*)formatDate;

/**
 * Formats the date according to how old it is.
 *
 * For dates less than a day old, the format is 'h:mm a', for less than a week old the
 * format is 'EEEE', and for anything older the format is 'M/d/yy'.
 */
- (NSString*)formatShortTime;

/**
 * Formats the date according to how old it is.
 *
 * For dates less than a day old, the format is 'h:mm a', for less than a week old the
 * format is 'EEE h:mm a', and for anything older the format is 'MMM d h:mm a'.
 */
- (NSString*)formatDateTime;

/**
 * Formats dates within 24 hours like '5 minutes ago', or calls formatDateTime if older.
 */
- (NSString*)formatRelativeTime;

/**
 * Formats dates within 1 week like '5m' or '2d', or calls formatShortTime if older.
 */
- (NSString*)formatShortRelativeTime;

/**
 * Formats the date with 'MMMM d", "Today", or "Yesterday".
 *
 * You must supply date components for today and yesterday because they are relatively expensive
 * to create, so it is best to avoid creating them every time you call this method if you
 * are going to be calling it multiple times in a loop.
 */
- (NSString*)formatDay:(NSDateComponents*)today yesterday:(NSDateComponents*)yesterday;

/**
 * Formats the date with 'MMMM".
 */
- (NSString*)formatMonth;

/**
 * Formats the date with 'yyyy".
 */
- (NSString*)formatYear;


+ (NSDate *)convertLocalDateFromUTCDate:(NSDate *)utcDate;
+ (NSDate *)convertUTCDateFromLocalDate:(NSDate *)localDate;

+ (id)dateWithTimeIntervalSince1900:(NSTimeInterval)secs;
+ (NSString*)validRemainTimeSinceNowToDate:(NSString*)strDate;
+ (NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime;
+ (NSInteger)minutesBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime;
+ (NSInteger)minutesFromNowToDate:(NSDate*)dateTime;
+ (NSInteger)secondsBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime;


// date and time
+ (NSString*)dateDescriptionWithMediumStyle;
+ (NSString*)dateDescriptionFromFormat:(NSString*)format Date:(NSDate*)date;
+ (NSString*)getYear:(NSDate*)date Century:(BOOL)flag;
+ (NSString*)getMonth:(NSDate*)date;
+ (NSString*)getDay:(NSDate*)date;
+ (NSString*)getHour:(NSDate*)date Base24:(BOOL)flag;
+ (NSString*)getMinute:(NSDate*)date;
+ (NSString*)getSecond:(NSDate*)date;

@end
