//
//  NSDate+BCAddition.m
//  BCCoreLibrary
//
//  Created by Ji Will on 11/26/12.
//  Copyright (c) 2012 iBrand. All rights reserved.
//

#import "NSDate+BCAddition.h"

// Core
#import "BCLocaleUtility.h"

//#import "BCGlobalCoreLocale.h"


@implementation NSDate (BCAddition)
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Class public


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSDate*)dateWithToday
{
    return [[NSDate date] dateAtMidnight];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Public


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSDate*)dateAtMidnight
{
	NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	NSDateComponents *comps = [gregorian components:
                               (NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit)
                                           fromDate:[NSDate date]];
	NSDate *midnight = [gregorian dateFromComponents:comps];
    //	[gregorian release];
	return midnight;
}

+ (NSDate *)dateWithString:(NSString *)dateString inFormat:(NSString *)formatString
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = formatString;
    format.locale = [BCLocaleUtility currentLocale];
    return [format dateFromString:dateString];
}
///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)formatTime
{
    static NSDateFormatter* formatter = nil;
    if (nil == formatter) {
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = D_Method_LocalizedString(@"h:mm a");
        formatter.locale = [BCLocaleUtility currentLocale] ;//
    }
    return [formatter stringFromDate:self];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)formatDate
{
    static NSDateFormatter* formatter = nil;
    if (nil == formatter) {
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = D_Method_LocalizedString(@"EEEE, LLLL d, YYYY");
        formatter.locale = [BCLocaleUtility currentLocale];
    }
    return [formatter stringFromDate:self];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)formatShortTime
{
    NSTimeInterval diff = abs([self timeIntervalSinceNow]);
    
    if (diff < BC_DAY) {
        return [self formatTime];
        
    } else if (diff < BC_5_DAYS) {
        static NSDateFormatter* formatter = nil;
        if (nil == formatter) {
            formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = D_Method_LocalizedString(@"EEEE");
            formatter.locale = [BCLocaleUtility currentLocale];
        }
        return [formatter stringFromDate:self];
        
    } else {
        static NSDateFormatter* formatter = nil;
        if (nil == formatter) {
            formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = D_Method_LocalizedString(@"M/d/yy");
            formatter.locale = [BCLocaleUtility currentLocale];
        }
        return [formatter stringFromDate:self];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)formatDateTime
{
    NSTimeInterval diff = abs([self timeIntervalSinceNow]);
    if (diff < BC_DAY) {
        return [self formatTime];
        
    } else if (diff < BC_5_DAYS) {
        static NSDateFormatter* formatter = nil;
        if (nil == formatter) {
            formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = D_Method_LocalizedString(@"EEE h:mm a");
            formatter.locale = [BCLocaleUtility currentLocale];
        }
        return [formatter stringFromDate:self];
        
    } else {
        static NSDateFormatter* formatter = nil;
        if (nil == formatter) {
            formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = D_Method_LocalizedString(@"MMM d h:mm a");
            formatter.locale = [BCLocaleUtility currentLocale];
        }
        return [formatter stringFromDate:self];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)formatRelativeTime {
    NSTimeInterval elapsed = [self timeIntervalSinceNow];
    if (elapsed > 0) {
        if (elapsed <= 1) {
            return D_Method_LocalizedString(@"in just a moment");
        }
        else if (elapsed < BC_MINUTE) {
            int seconds = (int)(elapsed);
            return [NSString stringWithFormat:D_Method_LocalizedString(@"in %d seconds"), seconds];
            
        }
        else if (elapsed < 2*BC_MINUTE) {
            return D_Method_LocalizedString(@"in about a minute");
        }
        else if (elapsed < BC_HOUR) {
            int mins = (int)(elapsed/BC_MINUTE);
            return [NSString stringWithFormat:D_Method_LocalizedString(@"in %d minutes"), mins];
        }
        else if (elapsed < BC_HOUR*1.5) {
            return D_Method_LocalizedString(@"in about an hour");
        }
        else if (elapsed < BC_DAY) {
            int hours = (int)((elapsed+BC_HOUR/2)/BC_HOUR);
            return [NSString stringWithFormat:D_Method_LocalizedString(@"in %d hours"), hours];
        }
        else {
            return [self formatDateTime];
        }
    }
    else {
        elapsed = -elapsed;
        
        if (elapsed <= 1) {
            return D_Method_LocalizedString(@"just a moment ago");
            
        } else if (elapsed < BC_MINUTE) {
            int seconds = (int)(elapsed);
            return [NSString stringWithFormat:D_Method_LocalizedString(@"%d seconds ago"), seconds];
            
        } else if (elapsed < 2*BC_MINUTE) {
            return D_Method_LocalizedString(@"about a minute ago");
            
        } else if (elapsed < BC_HOUR) {
            int mins = (int)(elapsed/BC_MINUTE);
            return [NSString stringWithFormat:D_Method_LocalizedString(@"%d minutes ago"), mins];
            
        } else if (elapsed < BC_HOUR*1.5) {
            return D_Method_LocalizedString(@"about an hour ago");
            
        } else if (elapsed < BC_DAY) {
            int hours = (int)((elapsed+BC_HOUR/2)/BC_HOUR);
            return [NSString stringWithFormat:D_Method_LocalizedString(@"%d hours ago"), hours];
            
        } else {
            return [self formatDateTime];
        }
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)formatShortRelativeTime
{
    NSTimeInterval elapsed = abs([self timeIntervalSinceNow]);
    
    if (elapsed < BC_MINUTE) {
        return D_Method_LocalizedString(@"<1m");
        
    } else if (elapsed < BC_HOUR) {
        int mins = (int)(elapsed / BC_MINUTE);
        return [NSString stringWithFormat:D_Method_LocalizedString(@"%dm"), mins];
        
    } else if (elapsed < BC_DAY) {
        int hours = (int)((elapsed + BC_HOUR / 2) / BC_HOUR);
        return [NSString stringWithFormat:D_Method_LocalizedString(@"%dh"), hours];
        
    } else if (elapsed < BC_WEEK) {
        int day = (int)((elapsed + BC_DAY / 2) / BC_DAY);
        return [NSString stringWithFormat:D_Method_LocalizedString(@"%dd"), day];
        
    } else {
        return [self formatShortTime];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)formatDay:(NSDateComponents*)today yesterday:(NSDateComponents*)yesterday {
    static NSDateFormatter* formatter = nil;
    if (nil == formatter) {
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = D_Method_LocalizedString(@"MMMM d");
        formatter.locale = [BCLocaleUtility currentLocale];
    }
    
    NSCalendar* cal = [NSCalendar currentCalendar];
    NSDateComponents* day = [cal components:NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit
                                   fromDate:self];
    
    if (day.day == today.day && day.month == today.month && day.year == today.year) {
        return D_Method_LocalizedString(@"Today");
        
    } else if (day.day == yesterday.day && day.month == yesterday.month
               && day.year == yesterday.year) {
        return D_Method_LocalizedString(@"Yesterday");
        
    } else {
        return [formatter stringFromDate:self];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)formatMonth {
    static NSDateFormatter* formatter = nil;
    if (nil == formatter) {
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = D_Method_LocalizedString(@"MMMM");
        formatter.locale = [BCLocaleUtility currentLocale];
    }
    return [formatter stringFromDate:self];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)formatYear {
    static NSDateFormatter* formatter = nil;
    if (nil == formatter) {
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = D_Method_LocalizedString(@"yyyy");
        formatter.locale = [BCLocaleUtility currentLocale];
    }
    return [formatter stringFromDate:self];
}


+ (NSDate *)convertLocalDateFromUTCDate:(NSDate *)utcDate
{
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:utcDate];
    NSDate *retDate = [utcDate  dateByAddingTimeInterval:interval];
    return retDate;
}


+ (NSDate *)convertUTCDateFromLocalDate:(NSDate *)localDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString* strDate = [dateFormatter stringFromDate:localDate];
    
    // Modify by Arthur
    NSDateFormatter* outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate* retDate = [outputFormatter dateFromString:strDate];
    return retDate;
}



+ (id)dateWithTimeIntervalSince1900:(NSTimeInterval)secs
{
    NSDate *ret = nil;
    NSTimeInterval dateSec = secs - 2208960000;
    ret = [NSDate dateWithTimeIntervalSince1970:dateSec];
    return ret;
}




+ (NSString*)validRemainTimeSinceNowToDate:(NSString*)strDate
{
    NSString *strRemainDay = nil;
    
    if ([strDate hasPrefix:@"1900"] == NO) {
        // end date
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate *endDate = [dateFormatter dateFromString:strDate];
        
        // remain time
        NSDate *currentDate = [NSDate date];
        
        NSInteger remainDay = [NSDate daysBetweenDate:currentDate andDate:endDate];
        
        NSComparisonResult result = [currentDate compare:endDate];
        switch (result) {
            case NSOrderedAscending:
            {
                if (remainDay == 0) {
                    remainDay = 1;
                }
                strRemainDay = [NSString stringWithFormat:@"Surplus %d day", remainDay];
                break;
            }
            case NSOrderedDescending:
            {
                if (remainDay == 0) {
                    strRemainDay = [NSString stringWithFormat:@"Has expired"];
                }
                else {
                    strRemainDay = [NSString stringWithFormat:@"Has expired"];
                }
                break;
            }
            default:
                strRemainDay = [NSString stringWithFormat:@"Has expired"];
                break;
        }
    }
    else {
        strRemainDay = @"";
    }
    
    return strRemainDay;
}


+ (NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime
{
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&fromDate
                 interval:NULL forDate:fromDateTime];
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&toDate
                 interval:NULL forDate:toDateTime];
    
    NSDateComponents *difference = [calendar components:NSDayCalendarUnit
                                               fromDate:fromDate toDate:toDate options:0];
    
    
    return [difference day];
}


+ (NSInteger)minutesBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime
{
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSMinuteCalendarUnit
                startDate:&fromDate
                 interval:NULL
                  forDate:fromDateTime];
    [calendar rangeOfUnit:NSMinuteCalendarUnit
                startDate:&toDate
                 interval:NULL
                  forDate:toDateTime];
    
    NSDateComponents *difference = [calendar components:NSMinuteCalendarUnit
                                               fromDate:fromDate
                                                 toDate:toDate
                                                options:0];
    
    return [difference minute];
}


+ (NSInteger)minutesFromNowToDate:(NSDate*)dateTime
{
    NSDate *date = [NSDate date];
    return [NSDate minutesBetweenDate:dateTime andDate:date];
}


+ (NSInteger)secondsBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime
{
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSSecondCalendarUnit
                startDate:&fromDate
                 interval:NULL
                  forDate:fromDateTime];
    [calendar rangeOfUnit:NSSecondCalendarUnit
                startDate:&toDate
                 interval:NULL
                  forDate:toDateTime];
    
    NSDateComponents *difference = [calendar components:NSSecondCalendarUnit
                                               fromDate:fromDate
                                                 toDate:toDate
                                                options:0];
    
    return [difference second];
}


#pragma mark -
#pragma mark Date format

+ (NSString*)dateDescriptionWithMediumStyle
{
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];// autorelease];
	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
	[dateFormatter setTimeStyle:NSDateFormatterNoStyle];
	NSDate *date = [NSDate date];
	return [dateFormatter stringFromDate:date];
}


+ (NSString*)dateDescriptionFromFormat:(NSString *)format Date:(NSDate*)date
{
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];// autorelease];
	[dateFormatter setDateFormat:format];
	NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
	[dateFormatter setTimeZone:timeZone];
	return [dateFormatter stringFromDate:date];
}


+ (NSString*)getYear:(NSDate*)date Century:(BOOL)flag
{
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	
	// format
	if (flag) {
		[dateFormatter setDateFormat:@"Y"];
	}
	else {
		[dateFormatter setDateFormat:@"y"];
	}
	
	// value
	NSString *value = [dateFormatter stringFromDate:date];
//	[dateFormatter release];
	return value;
}


+ (NSString*)getMonth:(NSDate*)date
{
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	
	// format
	[dateFormatter setDateFormat:@"M"];
	
	// value
	NSString *value = [dateFormatter stringFromDate:date];
//	[dateFormatter release];

	return value;
}


+ (NSString*)getDay:(NSDate*)date
{
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	
	// format
	[dateFormatter setDateFormat:@"d"];
	
	// value
	NSString *value = [dateFormatter stringFromDate:date];
//	[dateFormatter release];
	
	return value;
}


+ (NSString*)getHour:(NSDate*)date Base24:(BOOL)flag
{
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	
	// format
	if (flag) {
		[dateFormatter setDateFormat:@"H"];
	}
	else {
		[dateFormatter setDateFormat:@"I"];
	}
    
	
	// value
	NSString *value = [dateFormatter stringFromDate:date];
//	[dateFormatter release];
	return value;
}


+ (NSString*)getMinute:(NSDate*)date
{
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	
	// format
	[dateFormatter setDateFormat:@"m"];
	
	// value
	NSString *value = [dateFormatter stringFromDate:date];
//	[dateFormatter release];
	
	return value;
}


+ (NSString*)getSecond:(NSDate*)date
{
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	
	// format
	[dateFormatter setDateFormat:@"S"];
	
	// value
	NSString *value = [dateFormatter stringFromDate:date];
//	[dateFormatter release];
	
	return value;
}


@end
