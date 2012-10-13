//
//  AppDelegate.h
//  TaskManager
//
//  Created by Erik Witt on 13.10.12.
//  Copyright (c) 2012 Erik Witt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TaskViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow* window;

@property (strong, nonatomic) TaskViewController* taskViewController;
@property (nonatomic) UINavigationController* navigationController;
@property (nonatomic) UISplitViewController* splitViewController;

@end
