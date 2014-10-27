//
//  NSCalendar+Util.m
//  BaseViewsExample
//
//  Created by Fairy on 14-10-27.
//  Copyright (c) 2014年 fairy.song. All rights reserved.
//

#import "NSCalendar+Util.h"

@implementation NSCalendar (Util)


-(NSInteger)daysWithinEraFromDate:(NSDate *) startDate toDate:(NSDate *) endDate {
    NSInteger startDay=[self ordinalityOfUnit:NSDayCalendarUnit inUnit: NSEraCalendarUnit forDate:startDate];
    
    NSInteger endDay=[self ordinalityOfUnit:NSDayCalendarUnit inUnit: NSEraCalendarUnit forDate:endDate];
    
    return endDay - startDay;
}


@end
