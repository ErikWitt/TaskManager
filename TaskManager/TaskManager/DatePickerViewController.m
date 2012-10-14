//
//  DatePickerViewController.m
//  TaskManager
//
//  Created by Erik Witt on 14.10.12.
//  Copyright (c) 2012 Erik Witt. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@property (nonatomic) IBOutlet UIDatePicker* datePicker;

@property (nonatomic) id<DatePickerViewControllerDelegate> delegate;


@end

@implementation DatePickerViewController

- (DatePickerViewController*) initWithDelegate: (id<DatePickerViewControllerDelegate>) delegate
{
    NSString* xibName;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        xibName = @"DatePickerViewController_iPhone";
    }
    else
    {
        xibName = @"DatePickerViewController_iPad";
    }
    self = [super initWithNibName:xibName bundle:nil];
    if (self)
    {
        self.delegate = delegate;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem* backButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(backButtonClicked)];
    
    [self.navigationItem setLeftBarButtonItem:backButton];
}

- (void) backButtonClicked
{
    [self.delegate datePickerViewController:self hasPickedDate: [self.datePicker date]];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
