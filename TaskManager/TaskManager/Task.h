//
//  Task.h
//  TaskManager
//
//  Created by Erik Witt on 13.10.12.
//  Copyright (c) 2012 Erik Witt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface Task : NSObject

@property (nonatomic) NSString* name;
@property (nonatomic) NSDate* date;
@property (nonatomic) NSString* description;
@property (nonatomic) CLLocationCoordinate2D coodinates;
@property (nonatomic) NSURL* url;


-(Task*) init;

-(Task*) initWithName:(NSString*) name Date: (NSDate*) date Description: (NSString*) description Coordinates: (CLLocationCoordinate2D) coordinates andUrl: (NSURL*) url;

- (NSString*) dateAsString;

@end
