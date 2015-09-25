//
//  EntryController.m
//  DayX
//
//  Created by jacob cook on 9/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "EntryController.h"

@interface EntryController ()

@property(strong, nonatomic)NSArray *entries;
@end

@implementation EntryController


//methods go after implementation


+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EntryController
                          new];
    });
    return sharedInstance;
}

-(void)addEntry:(Entry *)entry{
    NSMutableArray *mutableEntries = self.entries.mutableCopy;
    [mutableEntries addObject:entry];
    
    self.entries = mutableEntries;
}

-(void)moveEntry:(Entry *)entry{
    NSMutableArray *mutableEntries = self.entries.mutableCopy;
    [mutableEntries removeObject:entry];
    
    self.entries = mutableEntries;
}
-(Entry *)createEntryWithTitle:(NSString *)title bodyText:(NSString *)bodyText {
    
    Entry *entry = [Entry new];
    //this pointer is creating a new entry
    entry.title = title;
    entry.bodyText = bodyText;
    entry.timestamp = [NSDate date];
    
    [self addEntry:entry];
    
    return entry;
    
}



@end
