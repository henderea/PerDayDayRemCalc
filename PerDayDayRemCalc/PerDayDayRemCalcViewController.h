//
//  PerDayDayRemCalcViewController.h
//  PerDayDayRemCalc
//
//  Created by Eric Henderson on 2/27/12.
//

#import <UIKit/UIKit.h>
#import "StartDate.h"

@interface PerDayDayRemCalcViewController : UIViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) StartDate *sd;
@property (weak, nonatomic) IBOutlet UIDatePicker *dateSpinner;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UIStepper *perDaySpinnerButtons;
@property (weak, nonatomic) IBOutlet UILabel *perDaySpinnerLabel;

@end
