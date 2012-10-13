//
//  TaskViewControllerPad.h
//  TaskManager
//
//  Created by Erik Witt on 13.10.12.
//  Copyright (c) 2012 Erik Witt. All rights reserved.
//

#import "TaskViewController.h"
#import "TaskDetailViewControllerPad.h"

@interface TaskViewControllerPad : TaskViewController

- (TaskViewControllerPad*)initWithDetailViewController: (TaskDetailViewControllerPad*) detailViewController;

@end
