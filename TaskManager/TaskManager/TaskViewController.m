//
//  ViewController.m
//  TaskManager
//
//  Created by Erik Witt on 13.10.12.
//  Copyright (c) 2012 Erik Witt. All rights reserved.
//

#import "TaskViewController.h"
#import "Task.h"
#import "TaskDetailViewController.h"
#import "TaskCreateViewController.h"
#import "TaskStockService.h"

@interface TaskViewController ()<UITableViewDataSource, UITableViewDelegate, TaskCreateViewControllerDelegate>

@property (nonatomic) IBOutlet UITableView* taskTableView;

@property (nonatomic) TaskStockService* taskStockService;

@end

@implementation TaskViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
       
    self.taskStockService = [[TaskStockService alloc] init];
    
    [self.navigationItem setTitle:@"Tasks"];
    
    UIBarButtonItem* plusButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd target:self action:@selector(plusButtonClicked)];
    
    [self.navigationItem setRightBarButtonItem:plusButton];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.taskStockService.numberOfTasks;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Task* task = [self.taskStockService.tasks objectAtIndex:indexPath.row];
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"standard"];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"standard"];
    }
    
    cell.textLabel.text = task.name;
    cell.detailTextLabel.text = [task dateAsString];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Task* selectedTask = [self.taskStockService.tasks objectAtIndex:indexPath.row];
    
    [self taskDidChange:selectedTask];
    
}

- (void) taskDidChange:(Task *)task
{
    assert(0&&"You must override this Method");
}

- (void) plusButtonClicked
{
    TaskCreateViewController* controller = [[TaskCreateViewController alloc] initWithDelegate:self];
    
    [self.navigationController pushViewController:controller animated:YES];
}

- (void) taskCreated:(Task *)task
{
 
    if(task != nil)
    {
        [self.taskStockService addTask:task];
        [self.taskTableView reloadData];
        [self taskDidChange:task];
    }

}

- (void)tableView:(UITableView *)tv commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.taskStockService removeTaskAt:indexPath.row];
        [self.taskTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
