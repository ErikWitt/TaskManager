//
//  TaskDetailViewController.m
//  TaskManager
//
//  Created by Erik Witt on 13.10.12.
//  Copyright (c) 2012 Erik Witt. All rights reserved.
//

#import "TaskDetailViewController.h"
#import "Task.h"
#import "TaskWebViewController.h"
#import "TaskMapViewController.h"

@interface TaskDetailViewController ()

- (IBAction) hompageButtonClicked:(id)sender;

@end

@implementation TaskDetailViewController

- (TaskDetailViewController*) initWithTask: (Task*) task
{
    NSString* xibName;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        xibName = @"TaskDetailViewController_iPhone";
    }
    else
    {
        xibName = @"TaskDetailViewController_iPad";
    }
    
    self = [super initWithNibName:xibName bundle:nil];
    if (self)
    {
        self.task = task;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self displayTask];
    
    UIBarButtonItem* mapButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(mapButtonClicked)];
    
    [self.navigationItem setRightBarButtonItem:mapButton];
}

- (void) displayTask
{
    Task* task = self.task;
    
    self.titleLabel.text = task.name;
    self.descriptionTextView.text = task.description;
    self.dateLabel.text = [task dateAsString];
}

- (IBAction) hompageButtonClicked:(id)sender
{
    TaskWebViewController* webViewController = [[TaskWebViewController alloc] initWithURL:self.task.url];
    
    [self.navigationController pushViewController: webViewController animated:YES];
}

- (void) mapButtonClicked
{
    TaskMapViewController* mapViewController = [[TaskMapViewController alloc] initWithTask:self.task];

    [self.navigationController pushViewController:mapViewController animated:YES];
}

@end
