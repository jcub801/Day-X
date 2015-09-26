//
//  Entry.h
//  DayX
//
//  Created by jacob cook on 9/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const TitleKey = @"title";
static NSString *const BodyTextKey = @"bodyText";
static NSString * const TimeStampKey = @"timeStamp";


@interface Entry : NSObject

@property(strong, nonatomic)NSString *title;
@property(strong, nonatomic)NSString *bodyText;
@property(strong, nonatomic)NSDate *timestamp;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
//have to create the custom method to be implemented in the .m

-(NSDictionary *)dictionaryRepresentation;

@end
