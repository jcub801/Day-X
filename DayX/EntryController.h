//
//  EntryController.h
//  DayX
//
//  Created by jacob cook on 9/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface EntryController : NSObject

@property (strong, nonatomic, readonly)NSArray *entries;

+ (EntryController *) sharedInstance;

-(Entry *) createEntryWithTitle:(NSString *) title bodyText:(NSString *)bodyText;

-(void)addEntry:(Entry *) entry;
-(void)moveEntry:(Entry *)entry;

-(void)save;




@end
