//
//  DrawGauge.h
//  testclock
//
//  Created by LiJunliang on 15/5/15.
//  Copyright (c) 2015年 wondersgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Gauge : UIView
-(void)setNum:(CGFloat)num;
@property UIImageView *pointer;
@end
