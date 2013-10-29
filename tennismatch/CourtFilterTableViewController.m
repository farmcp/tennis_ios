//
//  CourtFilterTableViewController.m
//  tennismatch
//
//  Created by Christopher Farm on 10/20/13.
//  Copyright (c) 2013 com.ordinance. All rights reserved.
//

#import "CourtFilterTableViewController.h"

@interface CourtFilterTableViewController ()

@end

@implementation CourtFilterTableViewController

- (IBAction)toggleLightsSwitch:(id)sender{
    [[NSUserDefaults standardUserDefaults] setBool:lightsSwitch.isOn
                                            forKey:@"lights"];
}

- (IBAction)togglePrivateSwitch:(id)sender{
    [[NSUserDefaults standardUserDefaults] setBool:privateSwitch.isOn
                                            forKey:@"private"];
}

- (IBAction)togglePublicSwitch:(id)sender{
    [[NSUserDefaults standardUserDefaults] setBool:publicSwitch.isOn
                                            forKey:@"public"];
}

- (IBAction)toggleIndoorSwitch:(id)sender{
    [[NSUserDefaults standardUserDefaults] setBool:indoorSwitch.isOn
                                            forKey:@"indoor"];
}

- (IBAction)toggleOutdoorSwitch:(id)sender{
    [[NSUserDefaults standardUserDefaults] setBool:outdoorSwitch.isOn
                                            forKey:@"outdoor"];
}

- (IBAction)toggleHardSwitch:(id)sender{
    [[NSUserDefaults standardUserDefaults] setBool:hardCourtSwitch.isOn
                                            forKey:@"hardCourt"];
}

- (IBAction)toggleClaySwitch:(id)sender{
    [[NSUserDefaults standardUserDefaults] setBool:clayCourtSwitch.isOn
                                            forKey:@"clayCourt"];
}

- (IBAction)toggleGrassSwitch:(id)sender{
    [[NSUserDefaults standardUserDefaults] setBool:grassCourtSwitch.isOn
                                            forKey:@"grassCourt"];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //SET THE USER DEFAULTS - if the default is set to 0 then turn off. We use registerDefaults: in AppDelegate to make the default for all switches YES
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"lights"] == 0){
        [lightsSwitch setOn:NO];
    }
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"private"] == 0) {
        [privateSwitch setOn:NO];
    }
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"public"] == 0) {
        [publicSwitch setOn:NO];
    }
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"indoor"] == 0) {
        [indoorSwitch setOn:NO];
    }
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"outdoor"] == 0) {
        [outdoorSwitch setOn:NO];
    }
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"hardCourt"] == 0) {
        [hardCourtSwitch setOn:NO];
    }
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"clayCourt"] == 0) {
        [clayCourtSwitch setOn:NO];
    }
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"grassCourt"] == 0) {
        [grassCourtSwitch setOn:NO];
    }
    
    //NSLog(@"%hhd, %hhd, %hhd", [[NSUserDefaults standardUserDefaults] boolForKey:@"lights"], [[NSUserDefaults standardUserDefaults] boolForKey:@"private"], [[NSUserDefaults standardUserDefaults] boolForKey:@"public"]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
