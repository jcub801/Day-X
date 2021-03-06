//
//  DetailViewController.m
//  DayX
//
//  Created by jacob cook on 9/23/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "EntryController.h"

@interface DetailViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextView *UITextView;
@property (weak, nonatomic) IBOutlet UIButton *clearButtonTapped;
@property (weak, nonatomic) IBOutlet UITextField *textField;



@end

@implementation DetailViewController


- (IBAction)saveButtonTapped:(id)sender {
    
    if (self.entry) {
        self.entry.title = self.textField.text;
        self.entry.bodyText = self.UITextView.text;
        self.entry.timestamp = [NSDate date];
    } else{
        
    
    
    self.entry = [[EntryController sharedInstance] createEntryWithTitle:self.textField.text bodyText:self.UITextView.text];
    
}
    [[EntryController sharedInstance] save];
}




- (IBAction)textField:(id)sender {
    }

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateWithEntry:self.entry];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


- (IBAction)clearButtonTapped:(id)sender {
    self.textField.text = @"";
    self.UITextView.text =@"";
    //these clear the text fields when the clearbutton is tapped
    
}



-(void)updateWithEntry:(Entry *)entry {
    self.textField.text = entry.title;
    self.UITextView.text = entry.bodyText;
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    return YES;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
