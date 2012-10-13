//
//  TaskDetailViewController.h
//  TaskManager
//
//  Created by Erik Witt on 13.10.12.
//  Copyright (c) 2012 Erik Witt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@interface TaskDetailViewController : UIViewController

@property (nonatomic) IBOutlet UILabel* titleLabel;
@property (nonatomic) IBOutlet UILabel* dateLabel;
@property (nonatomic) IBOutlet UITextView* descriptionTextView;
@property (nonatomic) IBOutlet UIButton* homepageButton;


@property (nonatomic) Task* task;

- (TaskDetailViewController*) initWithTask: (Task*) task;
- (void) displayTask;

@end
