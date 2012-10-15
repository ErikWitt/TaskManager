//
//  TaskViewControllerPhone.m
//  TaskManager
//
//  Created by Erik Witt on 13.10.12.
//  Copyright (c) 2012 Erik Witt. All rights reserved.
//

#import "TaskViewControllerPhone.h"
#import "TaskDetailViewControllerPhone.h"

@interface TaskViewControllerPhone ()

@end

@implementation TaskViewControllerPhone

- (id)init
{
    self = [super initWithNibName:@"TaskViewController_iPhone" bundle:nil];
    return self;
}

- (void) taskDidChange:(Task *)task
{
    TaskDetailViewControllerPhone* taskDetailViewController = [[TaskDetailViewControllerPhone alloc] initWithTask: task];
    
    [self.navigationController pushViewController:taskDetailViewController animated:YES];
}



@end
