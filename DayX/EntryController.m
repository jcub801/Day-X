//
//  EntryController.m
//  DayX
//
//  Created by jacob cook on 9/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "EntryController.h"

static NSString * const AllEntriesKey = @"allEntries";

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
        
        [sharedInstance loadFromPersistentStorage];
        // Changed the code from the empty array to now load from persistant storage
    });
    
    return sharedInstance;
}

-(void)addEntry:(Entry *)entry{
    NSMutableArray *mutableEntries = self.entries.mutableCopy;
    [mutableEntries addObject:entry];
    
    self.entries = mutableEntries;
    [self saveToPersistentStorage];
}

-(void)moveEntry:(Entry *)entry{
    NSMutableArray *mutableEntries = self.entries.mutableCopy;
    [mutableEntries removeObject:entry];
    
    self.entries = mutableEntries;
    [self saveToPersistentStorage];
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

-(void)saveToPersistentStorage {
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    for (Entry *entry in self.entries){
        [entryDictionaries addObject:[entry dictionaryRepresentation]];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:AllEntriesKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

-(void)save {
    [self saveToPersistentStorage];
}

-(void)loadFromPersistentStorage {
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:AllEntriesKey];
    // This is calling (or loading) the array with the AllEntriesKey
    
    NSMutableArray *entries = [NSMutableArray new];
    for (NSDictionary *entry in entryDictionaries){
        [entries addObject:[[Entry alloc] initWithDictionary:entry]];
        
    }
 
    self.entries = entries;
}





@end
