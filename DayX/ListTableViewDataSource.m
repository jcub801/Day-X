//
//  ListTableViewDataSource.m
//  DayX
//
//  Created by jacob cook on 9/23/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ListTableViewDataSource.h"
#import "EntryController.h"

@implementation ListTableViewDataSource


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell"];
//    cell.textLabel.text = [NSString stringWithFormat:@"Entry %ld", (long)indexPath.row];
    
    Entry *entry =[EntryController sharedInstance].enties[indexPath.row];
    
    cell.textLabel.text = entry.title;
    
    
    
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [EntryController sharedInstance].enties.count;
    //update numberofrowsinsection to use the count of objects in the entrycontrollersharedinstance entries array
    
  
    
    
}


@end
