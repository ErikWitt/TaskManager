//
//  TaskViewControllerPad.m
//  TaskManager
//
//  Created by Erik Witt on 13.10.12.
//  Copyright (c) 2012 Erik Witt. All rights reserved.
//

#import "TaskViewControllerPad.h"
#import "TaskDetailViewControllerPad.h"

@interface TaskViewControllerPad ()

@property (nonatomic) TaskDetailViewControllerPad* taskDetailViewController;

@end

@implementation TaskViewControllerPad

- (TaskViewControllerPad*)initWithDetailViewController: (TaskDetailViewControllerPad*) detailViewController
{
    self = [super initWithNibName:@"TaskViewController_iPad" bundle:nil];
    if (self) {
        self.taskDetailViewController = detailViewController;
    }
    return self;
}

- (void) taskDidChange:(Task *)task
{
    [self.taskDetailViewController changeTask:task];
}
@end
