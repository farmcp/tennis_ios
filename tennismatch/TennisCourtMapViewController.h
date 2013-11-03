//
//  TennisCourtMapViewController.h
//  tennismatch
//
//  Created by Christopher Farm on 10/13/13.
//  Copyright (c) 2013 com.ordinance. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

#import "LocationController.h"

@interface TennisCourtMapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    
    IBOutlet MKMapView *worldView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
}
@end
