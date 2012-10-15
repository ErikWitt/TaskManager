//
//  TaskWebViewController.m
//  TaskManager
//
//  Created by Erik Witt on 13.10.12.
//  Copyright (c) 2012 Erik Witt. All rights reserved.
//

#import "TaskWebViewController.h"

@interface TaskWebViewController ()

@property (nonatomic) NSURL* url;
@property (nonatomic) IBOutlet UIWebView* webView;

@end

@implementation TaskWebViewController

- (TaskWebViewController*) initWithURL: (NSURL*) url
{
    NSString* xibName;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        xibName = @"TaskWebViewController_iPhone";
    }
    else
    {
        xibName = @"TaskWebViewController_iPad";
    }
    
    self = [super initWithNibName:xibName bundle:nil];
    if (self)
    {
        self.url = url;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.url]];
    
    [self.navigationItem setTitle:@"Homepage"];
}

@end
