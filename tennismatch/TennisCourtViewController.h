//
//  TennisCourtViewController.h
//  tennismatch
//
//  Created by Christopher Farm on 11/19/13.
//  Copyright (c) 2013 com.ordinance. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TennisCourtViewController : UIViewController
@property (nonatomic) IBOutlet UILabel *courtNameLabel;
@property (nonatomic) IBOutlet UILabel *courtStreetLabel;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *street;

@end
