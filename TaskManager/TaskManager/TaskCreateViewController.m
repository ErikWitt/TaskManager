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
#import "TaskMapViewController.h"

@interface TaskCreateViewController ()<DatepickerDelegate,MapViewDelegate>

@property (nonatomic) IBOutlet UITextField* nameTextField;
@property (nonatomic) IBOutlet UITextField* dateTextField;
@property (nonatomic) IBOutlet UITextView* descriptionTextView;
@property (nonatomic) IBOutlet UITextField* homepageTextField;
@property (nonatomic) IBOutlet UITextField* locationTextField;
- (IBAction) saveButtonClicked;



@property (nonatomic) Task* task;


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
    if (self)
    {
        self.delegate = delegate;
        
        self.task = [[Task alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem* saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButtonClicked)];
    
    [self.navigationItem setRightBarButtonItem:saveButton];
    
    [self setupGesture];
        
    
    [self.navigationItem setTitle:@"new Task"];
    
    // Keyboard abschalten für textfelder
    UIView* dummyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.dateTextField.inputView = dummyView;
    self.locationTextField.inputView = dummyView;
          
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

- (IBAction)closeKeyboard:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction) saveButtonClicked 
{
    self.task.name = self.nameTextField.text;
    self.task.description = self.descriptionTextView.text;
    self.task.url = [NSURL URLWithString:self.homepageTextField.text];
    // date wird in delegate:datePicked: gesetzt
    // location wird in mapView:gotCoordinate: gesetzt
    
    
    [self.delegate taskCreated:self.task];
    [self.navigationController popViewControllerAnimated:YES];
}


-(IBAction)showDatePicker:(id)sender
{
    DatePickerViewController* datepicker = [[DatePickerViewController alloc] initWithDelegate:self];

    
//    [self presentViewController:datepicker animated:YES completion:nil];
    [self presentModalViewController:datepicker animated:YES];
}


-(IBAction) showCoordinateSelection:(id)sender
{
    
    TaskMapViewController* mapv = [[TaskMapViewController alloc] initWithDelegate:self];
    
    [self presentModalViewController:mapv animated:YES];
    
}
    
-(void) delegate:(DatePickerViewController *)sender datePicked:(NSDate *)date
{
   
    NSDateFormatter* format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd.MM.yyyy HH:mm"];
    
    NSString* formatiertesDatum = [format stringFromDate:date];
    
    [self.dateTextField setText:formatiertesDatum];
    
    self.task.date = date;
    
    [self closeKeyboard:self.dateTextField];
    
}

-(void) mapView:(TaskMapViewController*) sender gotCoordinate:(CLLocationCoordinate2D) coord
{
    self.task.coodinates = coord;
   
    self.locationTextField.text = [NSString stringWithFormat:@"%4.2f,%4.2f",coord.latitude,coord.longitude];
    
    [self closeKeyboard:self.locationTextField];
}



@end
