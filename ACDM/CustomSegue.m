//
//  CustomSegue.m
//  ACDM
//
//  Created by LiJunliang on 15/5/21.
//  Copyright (c) 2015年 wondersgroup. All rights reserved.
//

#import "CustomSegue.h"

@implementation CustomSegue

- (void)perform
{
    // Add your own animation code here.
    
    //[[self sourceViewController] pushViewController:[self destinationViewController] animated:NO];
    UIViewController *vc = [self sourceViewController];
    [vc.navigationController pushViewController:[self destinationViewController] animated:NO];
}
@end
