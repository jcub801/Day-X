//
//  Entry.m
//  DayX
//
//  Created by jacob cook on 9/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Entry.h"

@implementation Entry

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    if (self){
        self.title = dictionary[TitleKey];
        self.bodyText = dictionary[BodyTextKey];
        self.timestamp = dictionary[TimeStampKey];
    }
    return self;
    
}

-(NSDictionary *)dictionaryRepresentation{
    NSDictionary *dictionary = @{
                                 TitleKey : self.title,
                                 BodyTextKey : self.bodyText ,
                                 TimeStampKey : self.timestamp,
                            
                                 };
    return dictionary;
    //implemenation dictionary representation, custom method was added in the.h file
}







@end
 
