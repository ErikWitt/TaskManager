//
//  Task.m
//  TaskManager
//
//  Created by Erik Witt on 13.10.12.
//  Copyright (c) 2012 Erik Witt. All rights reserved.
//

#import "Task.h"

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@implementation Task


-(Task*) init
{
    self = [super init];
    if(self)
    {
        self.name = @"";
        self.date = [NSDate date];
        self.description = @"";
        
        CLLocationCoordinate2D coord = {0,0};
        self.coodinates = coord;
        self.url = [[NSURL alloc] initWithString:@"http://www.nourl.no"];
    }
    return self;
}



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
