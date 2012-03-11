//
//  EditEntryViewController.h
//  PerDayDayRemCalc
//
//  Created by Eric Henderson on 3/3/12.
//

#import <UIKit/UIKit.h>
#import "Series.h"

@interface EditEntryViewController : UIViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *numField;
@property (weak, nonatomic) Series *mySeries;

@end
