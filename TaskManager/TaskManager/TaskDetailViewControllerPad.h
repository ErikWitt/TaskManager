//
//  TaskDetailViewControllerPad.h
//  TaskManager
//
//  Created by Erik Witt on 13.10.12.
//  Copyright (c) 2012 Erik Witt. All rights reserved.
//

#import "TaskDetailViewController.h"

@interface TaskDetailViewControllerPad : TaskDetailViewController<UISplitViewControllerDelegate>

- (void) changeTask:(Task*) task;

@end
