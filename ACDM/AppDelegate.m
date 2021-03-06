//
//  AppDelegate.m
//  ACDM
//
//  Created by LiJunliang on 15/5/15.
//  Copyright (c) 2015年 wondersgroup. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
//    // 异步下载
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        //第一步，创建URL
//        
//        NSURL *url = [NSURL URLWithString:@"http://10.10.16.176:8080/acdm5/fpm/linkedFlightSearch.search.do"];
//       
//        //第二步，创建请求
//        
//        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
//        
//        [request setHTTPMethod:@"POST"];//设置请求方式为POST，默认为GET
//        
//        NSString *str = @"scheduledDateStart=2015-05-01 08:00:00&scheduledDateEnd=2015-05-10 23:00:00";//设置参数
//        NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
//        
//        [request setHTTPBody:data];
//        
//        //第三步，连接服务器
//        NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//        NSString *str1 = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
//        NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
//        [def setValue:str1 forKey:@"List"];
//        
//        // 回到主线程
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(str1);
//
//        });
//    });
    NSString *str1 = @"[{\
    \"updateDate\" : null,\
    \"id\" : 10862483,\
    \"_id\" : 10862483,\
    \"_operationTypeCode\" : \"REG\",\
    \"_scheduledDate\" : \"2015-05-01\",\
    \"_flightIdentity\" : \"9C8848\",\
    \"_aircraftRegistration\" : \"B6902\",\
    \"_runwayId\" : null,\
    \"_standPosition\" : \"51\",\
    \"_actualOnBlocksDateTime\" : \"14:19-\",\
    \"_flightNatureCode\" : \"PAX\",\
    \"_scheduledDateTime\" : \"14:30-\",\
    \"_estimatedDateTime\" : \"14:04-\",\
    \"_wheelsDownDateTime\" : \"14:07-\",\
    \"_codeShareStatus\" : null,\
    \"_tenMileOutDateTime\" : null,\
    \"_previousStationIataCode\" : \"LHW\",\
    \"_thisStationArrivalDt\" : \"14:07-\",\
    \"_previousStationDepartureDt\" : \"11:43-\",\
    \"_previousStationScheduledDt\" : \"11:50-\",\
    \"_previousStationEstimatedDt\" : \"11:50-\",\
    \"_previousStationAirborneDt\" : \"11:43-\",\
    \"id_\" : 10862862,\
    \"operationTypeCode_\" : \"REG\",\
    \"scheduledDate_\" : \"2015-05-01\",\
    \"flightIdentity_\" : \"9C8893\",\
    \"gateNumber_\" : \"C51\",\
    \"runwayId_\" : null,\
    \"standPosition_\" : \"51\",\
    \"flightNatureCode_\" : \"PAX\",\
    \"scheduledDateTime_\" : \"16:40-\",\
    \"estimatedDateTime_\" : null,\
    \"wheelsUpDateTime_\" : \"16:51-\",\
    \"gateOpenDateTime_\" : null,\
    \"gateCloseDateTime_\" : null,\
    \"nextStationIataCode_\" : \"XMN\",\
    \"nextStationActualDt_\" : \"18:28-\",\
    \"nextStationEstimatedDt_\" : \"18:24-\",\
    \"nextStationScheduledDt_\" : \"18:40-\",\
    \"actualOffBlocksDateTime_\" : \"16:37-\",\
    \"thisStationDepartureDt_\" : \"16:51-\",\
    \"nextStationArrivalDt_\" : \"18:28-\"\
}]";
            NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
            [def setValue:str1 forKey:@"List"];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.wondersgroup.ACDM" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"ACDM" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"ACDM.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
