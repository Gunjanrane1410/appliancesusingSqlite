//
//  SecondViewController.m
//  GRAppliancesSqlite
//
//  Created by Student P_07 on 23/10/16.
//  Copyright © 2016 Gunjan Rane. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)saveTaskWithSegment{
    if (localSegment.selectedSegmentIndex == 0) {
        [self saveTask];
    }
    else if (localSegment.selectedSegmentIndex == 1){
        [self saveTask];
    }
    else if (localSegment.selectedSegmentIndex == 2){
        [self saveTask];
    }
}
-(void)saveTask {
    
    
    NSString *taskFirst = self.taskFieldOne.text;
    NSString *taskSecond = self.taskFieldTwo.text;
    
    NSString *taskThird = self.taskFieldThree.text;
    
    if (localSegment.selectedSegmentIndex == 0) {
        if (taskFirst.length >0 ) {
            if (taskSecond.length > 0) {
                if (taskThird.length > 0) {
                    NSString *inserQueryOne = [NSString stringWithFormat:@"INSERT INTO DEVICE_TABLE(NAME,MODEL,PRICE,TYPE)VALUE('%@','%@','%@','TV')",taskFirst.uppercaseString,taskFirst,taskSecond];
                    
                    NSLog(@"%@",inserQueryOne);
                    int resultOne = [[GRDatabaseManager sharedManager]executeQuery:inserQueryOne];
                    if (resultOne == 1) {
                        NSLog(@"successfully inserted Task");
                    }
                    else{
                        NSLog(@"unable to insert task in SQLITE Database");
                    }
                    NSLog(@"Task Saved : %@ ",taskFirst);
                    
                    self.taskFieldOne.text = @"";
                    
                    self.taskFieldTwo.text = @"";
                    
                    self.taskFieldThree.text = @"";
                }
            }
        }
        else {
            NSLog(@"enter Task First to Save.");
        }
    }
    
    else if (localSegment.selectedSegmentIndex == 1){
        if (taskFirst.length >0 ) {
            if (taskSecond.length > 0) {
                if (taskThird.length > 0) {
                    NSString *inserQueryOne = [NSString stringWithFormat:@"INSERT INTO DEVICE_TABLE(NAME,MODEL,PRICE,TYPE)VALUE('%@','%@','%@','SmartPhone')",taskFirst.uppercaseString,taskFirst,taskSecond];
                    
                    
                    NSLog(@"%@",inserQueryOne);
                    int resultOne = [[GRDatabaseManager sharedManager]executeQuery:inserQueryOne];
                    if (resultOne == 1) {
                        NSLog(@"successfully inserted Task");
                    }
                    else{
                        NSLog(@"unable to insert task in SQLITE Database");
                    }
                    NSLog(@"Task Saved : %@ ",taskFirst);
                    
                    self.taskFieldOne.text = @"";
                    
                    self.taskFieldTwo.text = @"";
                    
                    self.taskFieldThree.text = @"";
                }
            }
        }
        else {
            NSLog(@"enter Task First to Save.");
        }
    }
        
    else if (localSegment.selectedSegmentIndex == 2){
            if (taskFirst.length >0 ) {
                if (taskSecond.length > 0) {
                    if (taskThird.length > 0) {
                        NSString *inserQueryOne = [NSString stringWithFormat:@"INSERT INTO DEVICE_TABLE(NAME,MODEL,PRICE,TYPE)VALUE('%@','%@','%@','AC')",taskFirst.uppercaseString,taskSecond,taskThird];
                        
                        NSLog(@"%@",inserQueryOne);
                        int resultOne = [[GRDatabaseManager sharedManager]executeQuery:inserQueryOne];
                        if (resultOne == 1) {
                            NSLog(@"successfully inserted Task");
                        }
                        else{
                            NSLog(@"unable to insert task in SQLITE Database");
                        }
                        NSLog(@"Task Saved : %@ ",taskFirst);
                        
                        self.taskFieldOne.text = @"";
                        
                        self.taskFieldTwo.text = @"";
                        
                        self.taskFieldThree.text = @"";
                    }
                }
            }
            else {
                NSLog(@"enter Task First to Save.");
            }
        }
        
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    if (textField == self.taskFieldOne) {
        [self.taskFieldTwo resignFirstResponder];
    }
    else if (textField == self.taskFieldThree){
        [self.taskFieldThree resignFirstResponder];
    }
    return YES;
}

//- (IBAction)saveAction:(id)sender {
//    
//    [self saveTaskWithSegment];
//    
//}

- (IBAction)segmentControl:(id)sender {
    localSegment = sender;
        localSegment = sender;
    if (localSegment.selectedSegmentIndex == 0) {
        [_taskFieldOne setPlaceholder:@"Enter model :"];
        
        [_taskFieldTwo setPlaceholder:@"Enter Price :"];
        
        [_taskFieldThree setPlaceholder:@"Enter warranty :"];

        [self saveTask];
    }
    else if (localSegment.selectedSegmentIndex == 1){
        [_taskFieldOne setPlaceholder:@"Enter company :"];
        
        [_taskFieldTwo setPlaceholder:@"Enter Price :"];
        
        [_taskFieldThree setPlaceholder:@"Enter warranty :"];
        
        [self saveTask];    }
    else if (localSegment.selectedSegmentIndex ==2){
        [_taskFieldOne setPlaceholder:@"Enter company :"];
        
        [_taskFieldTwo setPlaceholder:@"Enter model :"];
        
        [_taskFieldThree setPlaceholder:@"Enter price :"];
        
        [self saveTask];
    }
}

- (IBAction)saveAction:(id)sender {
    [self saveTaskWithSegment];
}
@end
