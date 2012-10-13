//
//  Task.m
//  TaskManager
//
//  Created by Erik Witt on 13.10.12.
//  Copyright (c) 2012 Erik Witt. All rights reserved.
//

#import "Task.h"

@implementation Task

- (Task*) initWithName:(NSString*) name Date: (NSDate*) date Description: (NSString*) description Coordinates: (CLLocationCoordinate2D) coordinates andUrl: (NSURL*) url
{
    self = [super init];
    if (self)
    {
        self.name = name;
        self.date = date;
        self.description = description;
        self.coodinates = coordinates;
        self.url = url;
    }
    return self;
}

- (NSString*) dateAsString
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd.MM.yyyy"];

    return [dateFormat stringFromDate:self.date];
}

@end
