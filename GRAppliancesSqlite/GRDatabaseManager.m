//
//  GRDatabaseManager.m
//  GRAppliancesSqlite
//
//  Created by Student P_07 on 23/10/16.
//  Copyright © 2016 Gunjan Rane. All rights reserved.
//

#import "GRDatabaseManager.h"

@implementation GRDatabaseManager

+(instancetype)sharedManager{
    
    static GRDatabaseManager *sharedInstance;
    
    if (sharedInstance == nil) {
        sharedInstance = [[GRDatabaseManager alloc]init];
    }
    
    return sharedInstance;
    

}
-(NSString *)getDatabasePath{
    return [NSHomeDirectory()stringByAppendingPathComponent:@"Documents/GRAppliances.sqlite"];
    
    
    
    
}
-(int)executeQuery:(NSString *)query{
    
    
    int success = 0;
    sqlite3_stmt *statement;
    
    const char *UTFQuery = [query UTF8String];
    const char *UTFDatabasePath = [[self getDatabasePath]UTF8String];
    
    if (sqlite3_open(UTFDatabasePath,&myDatabase)==SQLITE_OK) {
        if (sqlite3_prepare_v2(myDatabase,UTFQuery,-1,&statement,NULL)==SQLITE_OK) {
            if (sqlite3_step(statement)==SQLITE_DONE) {
                success = 1;            }
        }
        else{
            NSLog(@"%s",sqlite3_errmsg(myDatabase));
        }
        
        sqlite3_close(myDatabase);
        }
        return success;
}
-(NSMutableArray *)getAllTaskTV{
    NSMutableArray *myArray = [[NSMutableArray alloc]init];
    sqlite3_stmt *statement;
    NSString *query = @"SELECT * FROM DEVICE_TABLE WHERE DEVICE_TYPE = 'TV'";
    const char *UTFquery = [query UTF8String];
    const char *UTFDatabasePath = [[self getDatabasePath]UTF8String];
    if (sqlite3_open(UTFDatabasePath, &myDatabase)== SQLITE_OK) {
        if (sqlite3_prepare_v2(myDatabase, UTFquery, -1, &statement, nil)== SQLITE_OK) {
            while (sqlite3_step(statement)== SQLITE_ROW) {
                const char * taskString = (const char *)
                sqlite3_column_text(statement, 0);
                const char * modelString = (const char *)
                sqlite3_column_text(statement, 1);
                const char * priceString = (const char *)
                sqlite3_column_text(statement, 2);
                //const char * yearString = (const char *)
//                sqlite3_column_text(statement, 3);
               const char * deviceType = (const char *)
                sqlite3_column_text(statement, 3);
               
                
                NSString *taskID = [NSString stringWithUTF8String:taskString];
               
                NSString *model = [NSString stringWithUTF8String:modelString];
               
                NSString *price = [NSString stringWithUTF8String:priceString];
                
                NSString *deviceTypes = [NSString stringWithUTF8String:deviceType];
                
                NSDictionary *tvDic = [[NSDictionary alloc]initWithObjects:@[taskID,model,price,deviceTypes] forKeys:@[@"TV_ID",@"model",@"price",@"TV"]];
                [myArray addObject:tvDic];
                NSLog(@"%@",myArray);
            }
        }
        sqlite3_close(myDatabase);
    }
    return myArray;
}

-(NSMutableArray *)getAllTaskSmartPhone{
    NSMutableArray *myArray = [[NSMutableArray alloc]init];
    sqlite3_stmt *statement;
    NSString *query = @"SELECT * FROM DEVICE_TABLE WHERE DEVICE_TYPE = 'SmartPhone'";
    const char *UTFquery = [query UTF8String];
    const char *UTFDatabasePath = [[self getDatabasePath]UTF8String];
    if (sqlite3_open(UTFDatabasePath, &myDatabase)== SQLITE_OK) {
        if (sqlite3_prepare_v2(myDatabase, UTFquery, -1, &statement, nil)== SQLITE_OK) {
            while (sqlite3_step(statement)== SQLITE_ROW) {
                const char * taskString = (const char *)
                sqlite3_column_text(statement, 0);
                const char * companyString = (const char *)
                sqlite3_column_text(statement, 1);
                const char * priceString = (const char *)
                sqlite3_column_text(statement, 2);
               // const char * yearString = (const char *)
               // sqlite3_column_text(statement, );
                const char * deviceType = (const char *)
                sqlite3_column_text(statement, 3);
                
                
                NSString *taskID = [NSString stringWithUTF8String:taskString];
                
                NSString *company = [NSString stringWithUTF8String:companyString];
                
                NSString *price = [NSString stringWithUTF8String:priceString];
                
                NSString *deviceTypes = [NSString stringWithUTF8String:deviceType];
                
                NSDictionary *SmartPhoneDic = [[NSDictionary alloc]initWithObjects:@[taskID,company,price,deviceTypes] forKeys:@[@"SmartPhone_ID",@"company",@"price",@"SmartPhone"]];
                [myArray addObject:SmartPhoneDic];
                NSLog(@"%@",myArray);
            }
        }
        sqlite3_close(myDatabase);
    }
    return myArray;
}
-(NSMutableArray *)getAllTaskAC{
    NSMutableArray *myArray = [[NSMutableArray alloc]init];
    sqlite3_stmt *statement;
    NSString *query = @"SELECT * FROM DEVICE_TABLE WHERE DEVICE_TYPE = 'AC'";
    const char *UTFquery = [query UTF8String];
    const char *UTFDatabasePath = [[self getDatabasePath]UTF8String];
    if (sqlite3_open(UTFDatabasePath, &myDatabase)== SQLITE_OK) {
        if (sqlite3_prepare_v2(myDatabase, UTFquery, -1, &statement, nil)== SQLITE_OK) {
            while (sqlite3_step(statement)== SQLITE_ROW) {
                const char * taskString = (const char *)
                sqlite3_column_text(statement, 0);
                const char * companyString = (const char *)
                sqlite3_column_text(statement, 1);
                const char * priceString = (const char *)
                sqlite3_column_text(statement, 2);
                // const char * yearString = (const char *)
                // sqlite3_column_text(statement, );
                const char * deviceType = (const char *)
                sqlite3_column_text(statement, 3);
                
                
                NSString *taskID = [NSString stringWithUTF8String:taskString];
                
                NSString *company = [NSString stringWithUTF8String:companyString];
                
                NSString *price = [NSString stringWithUTF8String:priceString];
                
                NSString *deviceTypes = [NSString stringWithUTF8String:deviceType];
                
                NSDictionary *ACDic = [[NSDictionary alloc]initWithObjects:@[taskID,company,price,deviceTypes] forKeys:@[@"AC_ID",@"company",@"price",@"AC"]];
                [myArray addObject:ACDic];
                NSLog(@"%@",myArray);
            }
        }
        sqlite3_close(myDatabase);
    }
    return myArray;
}


@end



