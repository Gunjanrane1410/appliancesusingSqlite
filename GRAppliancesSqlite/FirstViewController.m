//
//  FirstViewController.m
//  GRAppliancesSqlite
//
//  Created by Student P_07 on 23/10/16.
//  Copyright © 2016 Gunjan Rane. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    TVArray = [[NSMutableArray alloc]init];
    SmartPhoneArray = [[NSMutableArray alloc]init];
    ACArray = [[NSMutableArray alloc]init];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated{
    [self reloadTask];
}
-(void)reloadTask{
    if (localSegment.selectedSegmentIndex == 0) {
        TVArray = [[GRDatabaseManager sharedManager]getAllTaskTV];
        [self.tableView reloadData];
        //NSLog(@"%@",TVArray);
    }
    else if (localSegment.selectedSegmentIndex == 1){
        SmartPhoneArray = [[GRDatabaseManager sharedManager]getAllTaskSmartPhone];
        [self.tableView reloadData];
    }
    else if (localSegment.selectedSegmentIndex == 2){
        ACArray = [[GRDatabaseManager sharedManager]getAllTaskAC];
        [self.tableView reloadData];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //return allTask.count;
    
    if (localSegment.selectedSegmentIndex == 0) {
        return TVArray.count;
    }
    else if (localSegment.selectedSegmentIndex == 1){
        return  SmartPhoneArray.count;
    }
    else if (localSegment.selectedSegmentIndex == 2){
        return  ACArray.count;
    }
    return  0 ;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
   // cell.textLabel.text = [allTask objectAtIndex:indexPath.row];
   // return cell;
    
    
    
    customTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Device_cell"];
    
    if (localSegment.selectedSegmentIndex == 0) {
        NSDictionary *TVData = [TVArray objectAtIndex:indexPath.row];
        
        cell.firstLable.text = [TVData valueForKey:@"model"];
        cell.secondLable.text= [TVData valueForKey:@"price"];
        cell.thirdLable.text =[TVData valueForKey:@"year"];
        NSLog(@"%@",cell.firstLable.text);
        NSLog(@"%@",cell.secondLable.text);
        NSLog(@"%@",cell.thirdLable.text);

    }
    else if (localSegment.selectedSegmentIndex == 1){
        NSDictionary *SmartPhoneData = [SmartPhoneArray objectAtIndex:indexPath.row];
        
        cell.firstLable.text = [SmartPhoneData valueForKey:@"company"];
        cell.secondLable.text= [SmartPhoneData valueForKey:@"price"];
        cell.thirdLable.text =[SmartPhoneData valueForKey:@"year"];
        NSLog(@"%@",cell.firstLable.text);
        NSLog(@"%@",cell.secondLable.text);
        NSLog(@"%@",cell.thirdLable.text);
        

    }
    else if (localSegment.selectedSegmentIndex == 2){
        NSDictionary *ACData = [SmartPhoneArray objectAtIndex:indexPath.row];
        
        cell.firstLable.text = [ACData valueForKey:@"company"];
        cell.secondLable.text= [ACData valueForKey:@"price"];
        cell.thirdLable.text =[ACData valueForKey:@"year"];
        NSLog(@"%@",cell.firstLable.text);
        NSLog(@"%@",cell.secondLable.text);
        NSLog(@"%@",cell.thirdLable.text);
        

    }
    return cell;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //NSLog(@"DELETE");
    if (localSegment.selectedSegmentIndex == 0) {
        
    
    NSString *task = [TVArray objectAtIndex:indexPath.row];
    NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM DEVICE_TABLE WHERE DEVICE_ID = '%@'",[task valueForKey:@"TV_ID"]];
    
    if ([[GRDatabaseManager sharedManager]executeQuery:deleteQuery]== 1) {
        NSLog(@"Successfully Deleted");
        
        [self reloadTask];
    }
    else{
        
        NSLog(@"Failed to Delete Task.");
    }
    }
    else if (localSegment.selectedSegmentIndex == 1){
        NSString *task = [SmartPhoneArray objectAtIndex:indexPath.row];
        NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM DEVICE_TABLE WHERE DEVICE_ID = '%@'",[task valueForKey:@"SmartPhone_ID"]];
        
        if ([[GRDatabaseManager sharedManager]executeQuery:deleteQuery]== 1) {
            NSLog(@"Successfully Deleted");
            
            [self reloadTask];
        }
        else{
            
            NSLog(@"Failed to Delete Task.");
        }

    }
    else if (localSegment.selectedSegmentIndex == 2){



NSString *task = [ACArray objectAtIndex:indexPath.row];
NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM DEVICE_TABLE WHERE DEVICE_ID = '%@'",[task valueForKey:@"AC_ID"]];

if ([[GRDatabaseManager sharedManager]executeQuery:deleteQuery]== 1) {
    NSLog(@"Successfully Deleted");
    
    [self reloadTask];
}
else{
    
    NSLog(@"Failed to Delete Task.");
}
    }

}


- (IBAction)segmentControl:(id)sender {
    localSegment = sender;
    if (localSegment.selectedSegmentIndex == 0) {
        [self.tableView reloadData];
    }else if (localSegment.selectedSegmentIndex == 1){
        [self.tableView reloadData];
        
    }
    else if (localSegment.selectedSegmentIndex == 2){
        [self.tableView reloadData];
    }

}
@end
