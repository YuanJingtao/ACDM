//
//  BorderWidthSmall.m
//  ACDM
//
//  Created by LiJunliang on 15/5/20.
//  Copyright (c) 2015年 wondersgroup. All rights reserved.
//

#import "BorderWidthSmall.h"

@implementation BorderWidthSmall


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.layer.cornerRadius = 8;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 0.2;
    self.layer.borderColor = [[UIColor blackColor] CGColor];
}


@end
