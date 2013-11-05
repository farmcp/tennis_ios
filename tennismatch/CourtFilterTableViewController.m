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
    BOOL isOn = [[NSUserDefaults standardUserDefaults] boolForKey:@"lights"];
    isOn = !isOn; //toggle
    [[NSUserDefaults standardUserDefaults] setBool:isOn forKey:@"lights"];
}

- (IBAction)togglePrivateSwitch:(id)sender{
    BOOL isOn = [[NSUserDefaults standardUserDefaults] boolForKey:@"private"];
    isOn = !isOn; //toggle
    [[NSUserDefaults standardUserDefaults] setBool:isOn forKey:@"private"];
}

- (IBAction)togglePublicSwitch:(id)sender{
    BOOL isOn = [[NSUserDefaults standardUserDefaults] boolForKey:@"public"];
    isOn = !isOn; //toggle
    [[NSUserDefaults standardUserDefaults] setBool:isOn forKey:@"public"];
}

- (IBAction)toggleIndoorSwitch:(id)sender{
    BOOL isOn = [[NSUserDefaults standardUserDefaults] boolForKey:@"indoor"];
    isOn = !isOn; //toggle
    [[NSUserDefaults standardUserDefaults] setBool:isOn forKey:@"indoor"];
}

- (IBAction)toggleOutdoorSwitch:(id)sender{
    BOOL isOn = [[NSUserDefaults standardUserDefaults] boolForKey:@"outdoor"];
    isOn = !isOn; //toggle
    [[NSUserDefaults standardUserDefaults] setBool:isOn forKey:@"outdoor"];
}

- (IBAction)toggleHardSwitch:(id)sender{
    BOOL isOn = [[NSUserDefaults standardUserDefaults] boolForKey:@"hardCourt"];
    isOn = !isOn; //toggle
    [[NSUserDefaults standardUserDefaults] setBool:isOn forKey:@"hardCourt"];
}

- (IBAction)toggleClaySwitch:(id)sender{
    BOOL isOn = [[NSUserDefaults standardUserDefaults] boolForKey:@"clayCourt"];
    isOn = !isOn; //toggle
    [[NSUserDefaults standardUserDefaults] setBool:isOn forKey:@"clayCourt"];
}

- (IBAction)toggleGrassSwitch:(id)sender{
    BOOL isOn = [[NSUserDefaults standardUserDefaults] boolForKey:@"grassCourt"];
    isOn = !isOn; //toggle
    [[NSUserDefaults standardUserDefaults] setBool:isOn forKey:@"grassCourt"];
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

    //SET THE USER DEFAULTS TO THEIR PROPER SWITCH POSITION
    lightsSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"lights"];
    privateSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"private"];
    publicSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"public"];
    indoorSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"indoor"];
    outdoorSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"outdoor"];
    hardCourtSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"hardCourt"];
    clayCourtSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"clayCourt"];
    grassCourtSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"grassCourt"];
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

-(void)viewWillDisappear:(BOOL)animated
{
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        // back button was pressed.  We know this is true because self is no longer
        // in the navigation stack.
        CATransition *transition = [CATransition animation];
        [transition setDuration:1.0];
        [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [transition setType:@"pageUnCurl"];
        [transition setSubtype:kCATransitionFromBottom];
        [transition setDelegate:self];
        [self.navigationController.view.layer addAnimation:transition forKey:nil];
    }
    
    [super viewWillDisappear:animated];
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
