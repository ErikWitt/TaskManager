//
//  DatePickerViewController.h
//  TaskManager
//
//  Created by Wolf Posdorfer on 14.10.12.
//  Copyright (c) 2012 Erik Witt. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DatepickerDelegate;


@interface DatePickerViewController : UIViewController

@property (nonatomic,weak) id<DatepickerDelegate> delegate;

-(IBAction) buttonClicked:(id)sender;


-(id) initWithDelegate:(id<DatepickerDelegate>)delegate;

@end




@protocol DatepickerDelegate

-(void) delegate:(DatePickerViewController*)sender datePicked: (NSDate*) date;

@end
