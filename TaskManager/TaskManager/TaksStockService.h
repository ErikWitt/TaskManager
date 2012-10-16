//
//  TaksStockService.h
//  TaskManager
//
//  Created by Erik Witt on 15.10.12.
//  Copyright (c) 2012 Erik Witt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"

@interface TaksStockService : NSObject

@property (nonatomic, readonly) NSMutableArray* tasks;

- (void) addTask:(Task*) task;
- (int) numberOfTasks;

@end
