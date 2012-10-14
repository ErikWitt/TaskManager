//
//  TaskCreateViewController.m
//  TaskManager
//
//  Created by Erik Witt on 14.10.12.
//  Copyright (c) 2012 Erik Witt. All rights reserved.
//

#import "TaskCreateViewController.h"
#import "Task.h"
#import <MapKit/MapKit.h>
#import "DatePickerViewController.h"

@interface TaskCreateViewController() <DatepickerDelegate>

@property (nonatomic) IBOutlet UITextField* nameTextField;
@property (nonatomic) IBOutlet UITextField* dateTextField;
@property (nonatomic) IBOutlet UITextView* descriptionTextView;
@property (nonatomic) IBOutlet UITextField* homepageTextField;
@property (nonatomic) IBOutlet UITextField* locationTextField;

@property (nonatomic) NSString* taskName;
@property (nonatomic) NSDate* taskDate;
@property (nonatomic) NSString* taskDescription;
@property (nonatomic) NSURL* taskUrl;
@property (nonatomic) CLLocationCoordinate2D taskLocation;

@property (nonatomic, weak) id<TaskCreateViewControllerDelegate> delegate;

- (IBAction)closeKeyboard:(id)sender;


@end

@implementation TaskCreateViewController

- (TaskCreateViewController*) initWithDelegate: (id<TaskCreateViewControllerDelegate>) delegate
{
    NSString* xibName;
     if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
     {
         xibName = @"TaskCreateViewController_iPhone";
     }
    else
    {
        xibName = @"TaskCreateViewController_iPad";
    }
    self = [super initWithNibName:xibName bundle:nil];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem* saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButtonClicked)];
    
    [self.navigationItem setRightBarButtonItem:saveButton];
    
    [self setupGesture];
    
}

-(void) setupGesture
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                initWithTarget:self
                                action:@selector(dismissKeyboard)];
    [tap setCancelsTouchesInView:NO];
    [self.view addGestureRecognizer:tap];
    
}

-(void) dismissKeyboard
{
    [self closeKeyboard:self.nameTextField];
    [self closeKeyboard:self.dateTextField];
    [self closeKeyboard:self.descriptionTextView];
    [self closeKeyboard:self.homepageTextField];
    [self closeKeyboard:self.locationTextField];
}

- (void) saveButtonClicked
{
    self.taskName = self.nameTextField.text;
    self.taskDescription = self.descriptionTextView.text;
    self.taskUrl = [NSURL URLWithString:self.homepageTextField.text];

    
    Task* task = [[Task alloc] initWithName:self.taskName Date:self.taskDate Description:self.taskDescription Coordinates:self.taskLocation andUrl:self.taskUrl];
    
    [self.delegate taskCreated:task];
    
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)closeKeyboard:(id)sender
{
    [sender resignFirstResponder];
}


-(IBAction)showDatePicker:(id)sender
{
    DatePickerViewController* datepicker = [[DatePickerViewController alloc] initWithDelegate:self];
    
    [self presentModalViewController:datepicker animated:YES];
    
}

-(void) delegate:(DatePickerViewController *)sender datePicked:(NSDate *)date
{

    self.taskDate = date;

}

@end
