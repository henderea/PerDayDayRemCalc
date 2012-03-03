//
//  Series.h
//  PerDayDayRemCalc
//
//  Created by Eric Henderson on 2/27/12.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Series : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * count;

@end
