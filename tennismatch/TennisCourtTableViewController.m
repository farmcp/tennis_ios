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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return rowcount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"courtCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    //get the image url from the website api if it exists - else use the default
    UIImageView *imv = (UIImageView *)[cell viewWithTag:100];
    imv.layer.masksToBounds = YES;
    imv.layer.cornerRadius = 10.0;
    if([[[[facilities objectAtIndex:indexPath.row] objectForKey:@"facility"] objectForKey:@"photos"] count] >= 1){
        NSString *img_url = [[[[[[facilities objectAtIndex:indexPath.row] objectForKey:@"facility"] objectForKey:@"photos"] objectAtIndex:0] objectForKey:@"photo"] objectForKey:@"url"];
    
        //Get image for the row if it exists
        NSURL *photoURL = [NSURL URLWithString:img_url];
        UIImage *photo = [UIImage imageWithData:[NSData dataWithContentsOfURL:photoURL]];
        imv.image = photo;
    }
    
    else{
        UIImage *photo = [UIImage imageNamed:@"default_logo.png"];
        imv.image = photo;
    }
    
    //set the text label
    UILabel *title_label = (UILabel *)[cell viewWithTag:101];
    title_label.text = [[NSMutableString stringWithFormat: @"%d", indexPath.row + 1] stringByAppendingString:@". "];
    title_label.text = [title_label.text stringByAppendingString:[[[facilities objectAtIndex:indexPath.row] objectForKey:@"facility"] objectForKey:@"name"]];
    UILabel *desc_label = (UILabel *)[cell viewWithTag:102];
    NSMutableString *desc_text = [[[facilities objectAtIndex:indexPath.row] objectForKey:@"facility"] objectForKey:@"street"];
    desc_label.text = desc_text;
    desc_label.text = [[desc_label.text stringByAppendingString:@" - "] stringByAppendingString:[[[facilities objectAtIndex:indexPath.row] objectForKey:@"facility"] objectForKey:@"city"]];
    
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
