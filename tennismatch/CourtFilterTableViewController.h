//
//  CourtFilterTableViewController.h
//  tennismatch
//
//  Created by Christopher Farm on 10/20/13.
//  Copyright (c) 2013 com.ordinance. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CourtFilterTableViewController : UITableViewController{
    IBOutlet UISwitch *lightsSwitch;
    IBOutlet UISwitch *privateSwitch;
    IBOutlet UISwitch *indoorSwitch;
    IBOutlet UISwitch *hardCourtSwitch;
    IBOutlet UISwitch *clayCourtSwitch;
    IBOutlet UISwitch *grassCourtSwitch;
}

- (IBAction)toggleOffLightsSwitch:(id)sender;
- (IBAction)toggleOffPrivateSwitch:(id)sender;
- (IBAction)toggleOffIndoorSwitch:(id)sender;
- (IBAction)toggleOffHardSwitch:(id)sender;
- (IBAction)toggleOffClaySwitch:(id)sender;
- (IBAction)toggleOffGrassSwitch:(id)sender;


@end
