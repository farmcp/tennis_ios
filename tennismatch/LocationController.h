//
//  LocationController.h
//  tennismatch
//
//  Created by Christopher Farm on 11/2/13.
//  Copyright (c) 2013 com.ordinance. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol LocationControllerDelegate
@required
- (void)locationUpdate:(CLLocation*)location;
@end

@interface LocationController : NSObject <CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    CLLocation *location;
    __weak id delegate;
}

@property (nonatomic, strong) CLLocationManager *locationManager;;
@property (nonatomic, strong) CLLocation *location;
@property (nonatomic, weak) id delegate;

+ (LocationController*) sharedLocationController;

@end
