//
//  DatePickerViewController.m
//  TaskManager
//
//  Created by Wolf Posdorfer on 14.10.12.
//  Copyright (c) 2012 Erik Witt. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@property (nonatomic) IBOutlet UIDatePicker* datepicker;

@end

@implementation DatePickerViewController



-(id) initWithDelegate:(id<DatepickerDelegate>)delegate
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
    
    self = [self initWithNibName:xibName bundle:nil];
    
    if(self)
    {
        self.delegate = delegate;
    }
    
    return self;
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction) buttonClicked:(id)sender;
{
    [self.delegate delegate:self datePicked:self.datepicker.date];
    
    [self dismissModalViewControllerAnimated:YES];
}

@end
