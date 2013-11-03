//
//  LocationController.m
//  tennismatch
//
//  Created by Christopher Farm on 11/2/13.
//  Copyright (c) 2013 com.ordinance. All rights reserved.
//

#import "LocationController.h"
static LocationController* sharedDelegate = nil;

@implementation LocationController
@synthesize locationManager, location, delegate;
- (id) init{
    self = [super init];
    if (self != nil){
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    }
    return self;
}

#pragma mark CLLocationManagerDelegate Methods
-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
//    NSLog(@"%@", [locations lastObject]);
}

- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"%@", error);
}

+ (LocationController *) sharedLocationController{
    static LocationController *sharedLocationControllerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedLocationControllerInstance = [[self alloc] init];
    });
    return sharedLocationControllerInstance;
}

-(void) dealloc{
    [locationManager setDelegate:nil];
}
@end
