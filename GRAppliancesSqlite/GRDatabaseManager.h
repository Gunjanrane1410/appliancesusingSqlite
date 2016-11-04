//
//  GRDatabaseManager.h
//  GRAppliancesSqlite
//
//  Created by Student P_07 on 23/10/16.
//  Copyright © 2016 Gunjan Rane. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface GRDatabaseManager : NSObject
{
    
    sqlite3 *myDatabase;

}
+(instancetype)sharedManager;

-(NSString *)getDatabasePath;

-(int)executeQuery:(NSString *)query;

-(NSMutableArray *)getAllTaskTV;

-(NSMutableArray *)getAllTaskSmartPhone;

-(NSMutableArray *)getAllTaskAC;


@end
