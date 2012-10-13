//
//  TaskDetailViewControllerPad.m
//  TaskManager
//
//  Created by Erik Witt on 13.10.12.
//  Copyright (c) 2012 Erik Witt. All rights reserved.
//

#import "TaskDetailViewControllerPad.h"

@interface TaskDetailViewControllerPad ()

@end

@implementation TaskDetailViewControllerPad

- (TaskDetailViewController*) init
{
    return [self initWithTask:nil];
}

- (TaskDetailViewController*) initWithTask: (Task*) task
{
    self = [super initWithNibName:@"TaskDetailViewController_iPad" bundle:nil];
    if (self)
    {
        self.task = task;
    }
    return self;
}

- (void) displayTask
{
    if (self.task) {
        [self.homepageButton setHidden:NO];
        [super displayTask];
    }
    else
    {
        [self.homepageButton setHidden:YES];
    }
}

- (void) changeTask:(Task*) task
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    self.task = task;
    [self displayTask];
}

- (void) splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
    [self.navigationItem setLeftBarButtonItem:barButtonItem];
    barButtonItem.title = @"Tasks";
}

- (void) splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    self.navigationItem.leftBarButtonItem = nil;
}
@end
