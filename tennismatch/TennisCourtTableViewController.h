//
//  TennisCourtTableViewController.h
//  tennismatch
//
//  Created by Christopher Farm on 10/12/13.
//  Copyright (c) 2013 com.ordinance. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlipSegue.h"
#import "LocationController.h"

@interface TennisCourtTableViewController : UITableViewController{
    CLLocationManager *locationManager;
    NSArray *facilities;
}

@property(nonatomic) int rowcount;

-(IBAction)mapViewButtonClick:(UIButton*)sender;
-(IBAction)filterButtonClick:(UIButton *)sender;

@end
