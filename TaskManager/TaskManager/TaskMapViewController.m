//
//  TaskMapViewController.m
//  TaskManager
//
//  Created by Erik Witt on 13.10.12.
//  Copyright (c) 2012 Erik Witt. All rights reserved.
//

#import "TaskMapViewController.h"
#import <MapKit/MapKit.h>
#import "Task.h"

@interface TaskMapViewController ()

@property (nonatomic) IBOutlet MKMapView* mapView;
@property (nonatomic) Task* task;

@end

@implementation TaskMapViewController

- (TaskMapViewController*) initWithTask: (Task*) task
{
    NSString* xibName;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        xibName = @"TaskMapViewController_iPhone";
    }
    else
    {
        xibName = @"TaskMapViewController_iPad";
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
    
    MKCoordinateRegion region = {self.task.coodinates,{50,50}};
    
    [self.mapView setRegion:region];
}

@end
