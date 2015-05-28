//
//  List.h
//  ACDM
//
//  Created by LiJunliang on 15/5/28.
//  Copyright (c) 2015年 wondersgroup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface List : NSObject

@property (nonatomic, retain) NSString * flightIdentity;
@property (nonatomic, retain) NSString * aircraftRegistration;
@property (nonatomic, retain) NSString * standPosition;
@property (nonatomic, retain) NSString * scheduledDate;
@property (nonatomic, retain) NSString * previousStationIataCode;
@property (nonatomic, retain) NSString * flightNatureCode;
@property (nonatomic, retain) NSString * thisStationArrivalDt;
@property (nonatomic, retain) NSString * id_;
@property (nonatomic, retain) NSString * state;

@end
