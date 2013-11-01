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
    IBOutlet UISwitch *publicSwitch;
    IBOutlet UISwitch *indoorSwitch;
    IBOutlet UISwitch *outdoorSwitch;
    IBOutlet UISwitch *hardCourtSwitch;
    IBOutlet UISwitch *clayCourtSwitch;
    IBOutlet UISwitch *grassCourtSwitch;
}

- (IBAction)toggleLightsSwitch:(id)sender;
- (IBAction)togglePrivateSwitch:(id)sender;
- (IBAction)togglePublicSwitch:(id)sender;
- (IBAction)toggleIndoorSwitch:(id)sender;
- (IBAction)toggleOutdoorSwitch:(id)sender;
- (IBAction)toggleHardSwitch:(id)sender;
- (IBAction)toggleClaySwitch:(id)sender;
- (IBAction)toggleGrassSwitch:(id)sender;


@end
