//
//  BottomView.m
//  ACDM
//
//  Created by LiJunliang on 15/5/15.
//  Copyright (c) 2015年 wondersgroup. All rights reserved.
//

#import "BottomView.h"

@interface BottomView()
@property UIButton *left;
@property UIButton *right;
@property NSArray *origincolor;
@end

@implementation BottomView
enum{selected=0,origin};

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    _left = (UIButton *)[self viewWithTag:1];
    _right = (UIButton *)[self viewWithTag:2];
    
    [_left addTarget:self action:@selector(leftButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [_right addTarget:self action:@selector(rightButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    _origincolor = [NSArray arrayWithObjects:_left.backgroundColor,_right.backgroundColor, nil];
}

-(void) leftButtonClicked{
    [_left setBackgroundColor:_origincolor[selected]];
    [_right setBackgroundColor:_origincolor[origin]];
    
}

-(void) rightButtonClicked{
    [_left setBackgroundColor:_origincolor[origin]];
    [_right setBackgroundColor:_origincolor[selected]];
}

@end
