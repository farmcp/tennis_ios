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

- (void)viewDidLoad
{
    [super viewDidLoad];
    locationManager = [[LocationController sharedLocationController] locationManager];

    //show the user in the MKMapView
    [worldView setShowsUserLocation:YES];
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

//MKMAPVIEW DELEGATE
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    //method is called when the user location is found - now need to zoom into the location
    CLLocationCoordinate2D location = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location, 500, 500);
    [worldView setRegion:region];
}

@end
