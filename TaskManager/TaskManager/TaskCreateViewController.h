//
//  TaskCreateViewController.h
//  TaskManager
//
//  Created by Erik Witt on 14.10.12.
//  Copyright (c) 2012 Erik Witt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@protocol TaskCreateViewControllerDelegate;

@interface TaskCreateViewController : UIViewController

- (TaskCreateViewController*) initWithDelegate: (id<TaskCreateViewControllerDelegate>) delegate;

@end

@protocol TaskCreateViewControllerDelegate

- (void) taskCreated: (Task*) task;

@end