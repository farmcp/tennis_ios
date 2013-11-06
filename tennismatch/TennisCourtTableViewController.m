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
@synthesize rowcount;

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
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tennisheader.png"]];

    NSString *url = @"http://www.tennismatch.us/api/v0/facilities?";
    NSString *latitude;
    NSString *longitude;
    
    locationManager = [[LocationController sharedLocationController] locationManager];
    [locationManager startUpdatingLocation];
    
    latitude = [NSString stringWithFormat:@"%f", locationManager.location.coordinate.latitude];
    longitude = [NSString stringWithFormat:@"%f", locationManager.location.coordinate.longitude];
    
    NSArray *myStrings = [[NSArray alloc] initWithObjects:url,@"lat=",latitude, @"&long=",longitude, nil];
    NSString *fullURL = [myStrings componentsJoinedByString:@""];
    NSLog(@"%@", fullURL);
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:fullURL]];
    NSURLResponse *resp = nil;
    NSError *err = nil;
    
    NSData *response = [NSURLConnection sendSynchronousRequest: request returningResponse: &resp error: &err];

    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
    facilities = [jsonDictionary objectForKey:@"facilities"];
    NSLog(@"%@", [[[facilities firstObject] objectForKey:@"facility"] objectForKey:@"name"]);
    rowcount = [[jsonDictionary objectForKey:@"facilities"] count];
    NSLog(@"%@", [jsonDictionary objectForKey:@"facilities"]);
    
//  NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData: response options: NSJSONReadingMutableContainers error: &err];

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
    NSLog(@"running section count");
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSLog(@"running count for rows: %d", rowcount);
    return rowcount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"courtCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    NSLog(@"%@", [facilities objectForKey:@"facility"]);
    cell.textLabel.text = [[[facilities objectAtIndex:indexPath.row] objectForKey:@"facility"] objectForKey:@"name"];
    cell.detailTextLabel.text = @"hello there";
    
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
