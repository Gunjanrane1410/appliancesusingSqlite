//
//  FirstViewController.h
//  GRAppliancesSqlite
//
//  Created by Student P_07 on 23/10/16.
//  Copyright © 2016 Gunjan Rane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "SecondViewController.h"
#import "GRDatabaseManager.h"
#import "customTableViewCell.h"
@interface FirstViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    
    NSMutableArray *TVArray;
     NSMutableArray *SmartPhoneArray;
     NSMutableArray *ACArray;
    
    UISegmentedControl *localSegment;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)segmentControl:(id)sender;

@end

