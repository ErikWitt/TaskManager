//
//  TaskDetailViewControllerPhone.m
//  TaskManager
//
//  Created by Erik Witt on 13.10.12.
//  Copyright (c) 2012 Erik Witt. All rights reserved.
//

#import "TaskDetailViewControllerPhone.h"
#import "Task.h"

@interface TaskDetailViewControllerPhone ()

@end

@implementation TaskDetailViewControllerPhone

- (TaskDetailViewController*) initWithTask: (Task*) task
{
    self = [super initWithNibName:@"TaskDetailViewController_iPhone" bundle:nil];
    if (self)
    {
        self.task = task;
    }
    return self;
}


@end
