//
//  TennisCourtMapViewController.m
//  tennismatch
//
//  Created by Christopher Farm on 10/13/13.
//  Copyright (c) 2013 com.ordinance. All rights reserved.
//

#import "TennisCourtMapViewController.h"

@interface TennisCourtMapViewController ()

@end

@implementation TennisCourtMapViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated
{
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        // back button was pressed.  We know this is true because self is no longer
        // in the navigation stack.
        CATransition *transition = [CATransition animation];
        [transition setDuration:1.0];
        [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [transition setType:@"oglFlip"];
        [transition setSubtype:kCATransitionFromRight];
        [transition setDelegate:self];
        [self.navigationController.view.layer addAnimation:transition forKey:nil];
    }
    
    [super viewWillDisappear:animated];
}
@end
