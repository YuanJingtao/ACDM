//
//  PlanFinishView.m
//  ACDM
//
//  Created by LiJunliang on 15/5/18.
//  Copyright (c) 2015年 wondersgroup. All rights reserved.
//

#import "PlanFinishView.h"

@implementation PlanFinishView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIView *borderView = [self viewWithTag:1];
    borderView.layer.cornerRadius = 8;
    borderView.layer.masksToBounds = YES;
    borderView.layer.borderWidth = 2.0;
    borderView.layer.borderColor = [[UIColor orangeColor] CGColor];
}


@end
