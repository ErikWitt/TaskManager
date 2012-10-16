//
//  TaksStockService.h
//  TaskManager
//
//  Created by Erik Witt on 15.10.12.
//  Copyright (c) 2012 Erik Witt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"

@interface TaskStockService : NSObject

@property (nonatomic, readonly) NSMutableArray* tasks;

- (void) addTask:(Task*) task;
- (void) removeTask:(Task*) task;
- (void) removeTaskAt:(int) index;
- (int) numberOfTasks;

@end
