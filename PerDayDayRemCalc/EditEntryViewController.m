//
//  EditEntryViewController.m
//  PerDayDayRemCalc
//
//  Created by Eric Henderson on 3/3/12.
//

#import "EditEntryViewController.h"

@implementation EditEntryViewController

@synthesize nameField = _nameField;
@synthesize numField = _numField;
@synthesize managedObjectContext = _managedObjectContext;
@synthesize mySeries = _mySeries;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(!self.mySeries)
    {
        self.nameField.text = @"";
        self.numField.text = @"";
    }
    else
    {
        self.nameField.text = self.mySeries.name;
        self.numField.text = [NSString stringWithFormat:@"%d",self.mySeries.count];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
