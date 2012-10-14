//
//  DatePickerViewController.h
//  TaskManager
//
//  Created by Erik Witt on 14.10.12.
//  Copyright (c) 2012 Erik Witt. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DatePickerViewControllerDelegate;

@interface DatePickerViewController : UIViewController

- (DatePickerViewController*) initWithDelegate: (id<DatePickerViewControllerDelegate>) delegate;

@end

@protocol DatePickerViewControllerDelegate

- (void) datePickerViewController: (DatePickerViewController*) controller hasPickedDate: (NSDate*) date;

@end