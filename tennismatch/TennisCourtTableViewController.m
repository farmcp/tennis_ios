//
//  TennisCourtTableViewController.m
//  tennismatch
//
//  Created by Christopher Farm on 10/12/13.
//  Copyright (c) 2013 com.ordinance. All rights reserved.
//

#import "TennisCourtTableViewController.h"

@interface TennisCourtTableViewController ()

@end

@implementation TennisCourtTableViewController

-(IBAction)mapViewButtonClick:(UIButton *)sender
{
    //go to the map view when clicking on the Map View button
    [self performSegueWithIdentifier:@"mapViewSegue" sender:nil];
}

-(IBAction)filterButtonClick:(UIButton *)sender
{
    //go to the filter view
    [self performSegueWithIdentifier:@"courtFilterSegue" sender:nil];
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
    
    NSString *url = @"http://www.tennismatch.us/api/v0/facilities?";
    NSString *latitude;
    NSString *longitude;
    
    locationManager = [[LocationController sharedLocationController] locationManager];
    [locationManager startUpdatingLocation];
    
    latitude = [NSString stringWithFormat:@"%f", locationManager.location.coordinate.latitude];
    longitude = [NSString stringWithFormat:@"%f", locationManager.location.coordinate.longitude];
    
    NSArray *myStrings = [[NSArray alloc] initWithObjects:url,@"lat=",latitude, @"&long=",longitude, nil];
    NSString *fullURL = [myStrings componentsJoinedByString:@""];
    NSLog(fullURL);
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:fullURL]];
    NSURLResponse *resp = nil;
    NSError *err = nil;
    
    NSData *response = [NSURLConnection sendSynchronousRequest: request returningResponse: &resp error: &err];
    NSString * theString = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    NSLog(@"response: %@", theString);
    
    
//    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData: response options: NSJSONReadingMutableContainers error: &err];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

//-(void) dealloc{
//    [locationManager setDelegate:nil];
//}

@end
