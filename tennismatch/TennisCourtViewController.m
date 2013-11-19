//
//  TennisCourtViewController.m
//  tennismatch
//
//  Created by Christopher Farm on 11/19/13.
//  Copyright (c) 2013 com.ordinance. All rights reserved.
//

#import "TennisCourtViewController.h"

@interface TennisCourtViewController ()

@end

@implementation TennisCourtViewController
@synthesize name;
@synthesize street;
@synthesize courtNameLabel;
@synthesize courtStreetLabel;

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
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tennisheader.png"]];

	// Do any additional setup after loading the view.
    courtNameLabel.text = name;
    courtStreetLabel.text = street;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
