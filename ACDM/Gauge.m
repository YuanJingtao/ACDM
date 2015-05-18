//
//  DrawGauge.m
//  testclock
//
//  Created by LiJunliang on 15/5/15.
//  Copyright (c) 2015年 wondersgroup. All rights reserved.
//

#import "Gauge.h"
#define PI 3.14159265358979323846
@implementation Gauge

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    UIImage *imageview = [UIImage imageNamed:@"gaugeback.png"];
    [imageview drawInRect:self.bounds];
    //添加指针
    UIImage *pointer = [UIImage imageNamed:@"arrow.png"];
    _pointer = [[UIImageView alloc] initWithImage:pointer];
    _pointer.layer.anchorPoint = CGPointMake(0.5, 0.5);
    _pointer.center = CGPointMake(50, 50);
    //pointer.transform = CGAffineTransformMakeScale(2, 2);
    
    [self addSubview:_pointer];
    //调整至0刻度
    _pointer.layer.transform = CATransform3DMakeRotation([self transToRadian:70], 0, 0, 1);
}

-(CGFloat)transToRadian:(CGFloat)angel
{
    return angel*M_PI/180;
}
//表盘共215度
-(void)setNum:(CGFloat)num
{
    if (0<=num&&num<=1) {
        self.pointer.layer.transform = CATransform3DMakeRotation([self transToRadian:70+num*215], 0, 0, 1);
    }
}
@end
