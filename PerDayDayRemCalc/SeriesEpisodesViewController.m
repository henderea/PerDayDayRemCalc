//
//  SeriesEpisodesViewController.m
//  PerDayDayRemCalc
//
//  Created by Eric Henderson on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SeriesEpisodesViewController.h"
#import "Series.h"


@implementation SeriesEpisodesViewController

@synthesize managedObjectContext = _managedObjectContext;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Series" inManagedObjectContext:self.managedObjectContext];
    [request setEntity:entity];
    NSError *error = nil;
    NSMutableArray *mutableFetchResults = [[self.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if(!mutableFetchResults)
    {
        return 0;
    }
    return mutableFetchResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ESCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Series" inManagedObjectContext:self.managedObjectContext];
    [request setEntity:entity];
    NSError *error = nil;
    NSMutableArray *mutableFetchResults = [[self.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if(!mutableFetchResults)
    {
        return cell;
    }
    Series *s = [mutableFetchResults objectAtIndex:indexPath.row];
    cell.textLabel.text = s.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%'d",s.count];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ListToEdit"])
    {
        //NSIndexPath *selectedRowIndex = [self.tableView indexPathForSelectedRow];
        //SubpageController *c = [segue destinationViewController];
        //Page *tmp = [[Pages sharedInstance].pages objectAtIndex:selectedRowIndex.row];
        //c.myPage = tmp;
    }
}

@end
