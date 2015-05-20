//
//  BorderView.m
//  ACDM
//
//  Created by LiJunliang on 15/5/18.
//  Copyright (c) 2015年 wondersgroup. All rights reserved.
//

#import "BorderView.h"



@implementation BorderView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.layer.cornerRadius = 8;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 2.0;
    self.layer.borderColor = [[UIColor grayColor] CGColor];
}


@end
