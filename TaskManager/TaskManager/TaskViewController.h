//
//  ViewController.h
//  TaskManager
//
//  Created by Erik Witt on 13.10.12.
//  Copyright (c) 2012 Erik Witt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@interface TaskViewController : UIViewController

- (void) taskDidChange:(Task*) task;

@end
