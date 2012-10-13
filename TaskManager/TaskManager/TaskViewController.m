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

@interface TaskViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) NSMutableArray* tasks;

@end

@implementation TaskViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CLLocationCoordinate2D location = {0, 0};
    
    Task* task = [[Task alloc] initWithName:@"Peter anrufen" Date:[NSDate date] Description:@"Peter sollte ziemlich bald angerufen werden" Coordinates: location andUrl:[NSURL URLWithString:@"http://www.google.com"]];

    Task* task1 = [[Task alloc] initWithName:@"Jochen anrufen" Date:[NSDate date] Description:@"Peter sollte ziemlich bald angerufen werden" Coordinates: location andUrl:[NSURL URLWithString:@"http://www.google.com"]];
    
    self.tasks = [NSMutableArray arrayWithObjects:task, task1, nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tasks count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Task* task = [self.tasks objectAtIndex:indexPath.row];
    
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
    Task* selectedTask = [self.tasks objectAtIndex:indexPath.row];
    
    [self taskDidChange:selectedTask];
    
}

- (void) taskDidChange:(Task *)task
{
    assert(0&&"You must override this Method");
}

@end
