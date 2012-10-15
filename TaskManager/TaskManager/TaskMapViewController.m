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

@property (nonatomic, weak) id<MapViewDelegate> delegate;

@property const BOOL gesture;

@end

@implementation TaskMapViewController


/*
 * Standard constructor
 */
-(id) initStuff
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
    
    return [super initWithNibName:xibName bundle:nil];
}

- (TaskMapViewController*) initWithTask: (Task*) task
{
       
    self = [self initStuff];
    if (self)
    {
        self.task = task;
        self.gesture = NO;
    }
    return self;

}

- (TaskMapViewController*) initWithDelegate: (id<MapViewDelegate>) delegate
{
   
    self = [self initStuff];
    if (self)
    {
        self.delegate = delegate;
        self.gesture = YES;
    }
    return self;
}


/*
 * Pin auf der Karte zeigen
 */
-(void) presentPin
{
    MKCoordinateRegion region = {self.task.coodinates, {0.6, 0.6}};
    
    
    MKPointAnnotation* annotation = [[MKPointAnnotation alloc] init];
    
    annotation.title = self.task.name;
    
    annotation.coordinate = self.task.coodinates;
    
    
    [self.mapView addAnnotation:annotation];
    [self.mapView setRegion:region];
}



/*
 * GestureRecognizer hinzufuegen zum Pin setzen
 */
-(void) startGestureRecon
{
    
    CLLocationCoordinate2D coord = {51,11};
    MKCoordinateRegion region = {coord,{6,7}};
    [self.mapView setRegion:region];
    
    UILongPressGestureRecognizer *longpress = [[UILongPressGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(addpin:)];
    longpress.minimumPressDuration = 1.5;
    
   // [self.mapView addGestureRecognizer:longpress];
    [self.view addGestureRecognizer:longpress];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    if(self.gesture)
    {
        [self startGestureRecon];
    }
    else
    {
        [self presentPin];
    }
    
    [self.navigationItem setTitle:@"Location"];
}


-(void) addpin:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateBegan)
        return;
    
    CGPoint touchPoint = [gestureRecognizer locationInView:self.mapView];
    CLLocationCoordinate2D touchMapCoordinate =
    [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    
    MKPointAnnotation *annot = [[MKPointAnnotation alloc] init];
    annot.coordinate = touchMapCoordinate;
    [self.mapView addAnnotation:annot];
    
    // Zeige Fenster
    
    
    
    [self.delegate mapView:self gotCoordinate:annot.coordinate];
    
    [self dismissModalViewControllerAnimated:YES];

}

@end
