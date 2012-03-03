//
//  PerDayDayRemCalcViewController.m
//  PerDayDayRemCalc
//
//  Created by Eric Henderson on 2/27/12.
//

#import "PerDayDayRemCalcViewController.h"
#import "Series.h"

@implementation PerDayDayRemCalcViewController

@synthesize managedObjectContext = _managedObjectContext;
@synthesize sd = _sd;
@synthesize dateSpinner = _dateSpinner;
@synthesize perDaySpinnerLabel = _perDaySpinnerLabel;
@synthesize perDaySpinnerButtons = _perDaySpinnerButtons;
@synthesize totalLabel = _totalLabel;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"StartDate" inManagedObjectContext:self.managedObjectContext];
    [request setEntity:entity];
    NSError *error = nil;
    NSMutableArray *mutableFetchResults = [[self.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if(!mutableFetchResults)
    {
        return;
    }
    self.sd = [mutableFetchResults objectAtIndex:0];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Series" inManagedObjectContext:self.managedObjectContext];
    [request setEntity:entity];
    NSError *error = nil;
    NSMutableArray *mutableFetchResults = [[self.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if(!mutableFetchResults)
    {
        self.totalLabel.text = @"0";
        return;
    }
    int total = 0;
    for (Series *s in mutableFetchResults)
    {
        total += [s.count intValue];
    }
    self.totalLabel.text = [NSString stringWithFormat:@"%'d", total];
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

- (IBAction)spinnerChanged
{
    self.perDaySpinnerLabel.text = [NSString stringWithFormat:@"%d",(int)self.perDaySpinnerButtons.value];
}

@end
