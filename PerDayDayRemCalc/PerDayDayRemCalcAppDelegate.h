//
//  PerDayDayRemCalcAppDelegate.h
//  PerDayDayRemCalc
//
//  Created by Eric Henderson on 2/27/12.
//

#import <UIKit/UIKit.h>

@interface PerDayDayRemCalcAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
