//
//  NSCalendar+Util.h
//  BaseViewsExample
//
//  Created by Fairy on 14-10-27.
//  Copyright (c) 2014年 fairy.song. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCalendar (Util)

-(NSInteger)daysWithinEraFromDate:(NSDate *) startDate toDate:(NSDate *) endDate;
@end
