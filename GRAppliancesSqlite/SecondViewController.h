//
//  SecondViewController.h
//  GRAppliancesSqlite
//
//  Created by Student P_07 on 23/10/16.
//  Copyright © 2016 Gunjan Rane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GRDatabaseManager.h"
@interface SecondViewController : UIViewController<UITextFieldDelegate>
{
    UISegmentedControl *localSegment;
}
@property (strong, nonatomic) IBOutlet UIButton *save;

@property (strong, nonatomic) IBOutlet UITextField *taskFieldOne;
@property (strong, nonatomic) IBOutlet UITextField *taskFieldTwo;
@property (strong, nonatomic) IBOutlet UITextField *taskFieldThree;
- (IBAction)segmentControl:(id)sender;
- (IBAction)saveAction:(id)sender;

@end

