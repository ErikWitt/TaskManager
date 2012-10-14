//
//  TaskMapViewController.h
//  TaskManager
//
//  Created by Erik Witt on 13.10.12.
//  Copyright (c) 2012 Erik Witt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Task.h"


@protocol MapViewDelegate;

@interface TaskMapViewController : UIViewController



/*
 *  Erstellt einen MapView und setzt einen Pin an die Stelle der Koordinate des Tasks
 */
- (TaskMapViewController*) initWithTask: (Task*) task;


/*
 *  Erstellt einen MapView und gibt bei einer langen TapGesture die Koordinate des Taps an den Delegate zurueck
 */
- (TaskMapViewController*) initWithDelegate: (id<MapViewDelegate>) delegate;

@end


@protocol MapViewDelegate

-(void) mapView:(TaskMapViewController*) sender gotCoordinate:(CLLocationCoordinate2D) coord;

@end
