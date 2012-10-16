//
//  TaksStockService.m
//  TaskManager
//
//  Created by Erik Witt on 15.10.12.
//  Copyright (c) 2012 Erik Witt. All rights reserved.
//

#import "TaksStockService.h"
#import "Task.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface TaksStockService()

@property (nonatomic, readwrite) NSMutableArray* tasks;

@end

@implementation TaksStockService

- (TaksStockService*) init
{
    self = [super init];
    if (self)
    {
        self.tasks = [[NSMutableArray alloc] init];
        [self loadTasksFromFile];
    }
    return self;
}

- (void) loadTasksFromFile
{
    [self generateTasksFromArray:[self readData]];
}

- (NSArray*) readData
{
    NSString* docFolder = [NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString * path = [docFolder stringByAppendingPathComponent:@"Data.plist"];
    NSArray *arrayFromPlist = [NSArray arrayWithContentsOfFile:path] ;
    
    if([arrayFromPlist count] == 0) // kann man hier auch auf nil testen?
    {
        path = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
        arrayFromPlist = [NSArray arrayWithContentsOfFile:path] ;
    }
    
    return arrayFromPlist;
}

- (void) generateTasksFromArray: (NSArray*) data
{
    for(id key in data)
    {
        
        NSDictionary* dictionary = (NSDictionary*)key;

        NSString* name = [dictionary objectForKey:@"name"];
        NSDate* date = [dictionary objectForKey:@"date"];
        NSString* description = [dictionary objectForKey:@"description"];
        NSURL* url = [NSURL URLWithString:[dictionary objectForKey:@"homepage"]];
        double x = [[dictionary objectForKey:@"coordinateX"] floatValue];
        double y = [[dictionary objectForKey:@"coordinateY"] floatValue];
        CLLocationCoordinate2D location = {x, y};
        
        Task* task = [[Task alloc] initWithName:name Date:date Description:description Coordinates:location andUrl:url];

        [self.tasks addObject:task];
    }
}

- (void) addTask:(Task*) task
{
    [self.tasks addObject:task];
    [self saveTasksToFile];
}

- (void) saveTasksToFile
{
    [self writeData:[self generateArrayFromTasks]];
}

- (NSArray*) generateArrayFromTasks
{
    NSLog(@"Methode generateArray Aufgerufen");
    NSMutableArray* result = [[NSMutableArray alloc] init];
    
    for (Task* task in self.tasks)
    {
        NSNumber* x = [NSNumber numberWithDouble: task.coodinates.latitude];
        NSNumber* y = [NSNumber numberWithDouble: task.coodinates.longitude];        
        
        NSArray* data = [NSArray arrayWithObjects:task.name, task.date, task.description, task.url.absoluteString, x, y, nil];
        
        NSArray* keys = [NSArray arrayWithObjects:@"name", @"date", @"description", @"homepage", @"coordinateX", @"coordinateY", nil];
        
        NSDictionary* dictionary = [NSDictionary dictionaryWithObjects:data forKeys:keys];
        
        [result addObject:dictionary];
    }
    NSLog(@"Result am Ende:%@", result);
    
    return [NSArray arrayWithArray:result];
}

-(void) writeData:(NSArray*) array{
    
    NSString* docFolder = [NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString * path = [docFolder stringByAppendingPathComponent:@"Data.plist"];
    
    if([array writeToFile:path atomically: YES])
    {
        NSLog(@"write successful, Path: %@", path);
    }
    else
    {
        NSLog(@"write failed");
    }
}

- (int) numberOfTasks
{
    return [self.tasks count];
}

@end
