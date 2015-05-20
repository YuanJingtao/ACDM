//
//  ProgressBar.m
//  testclock
//
//  Created by LiJunliang on 15/5/18.
//  Copyright (c) 2015年 wondersgroup. All rights reserved.
//

#import "ProgressBar.h"

#define blockwidth 10
#define spacewidth 2

@interface ProgressBar()
@property UILabel *label;
@end

@implementation ProgressBar


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.layer.cornerRadius = 4;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 2.0;
    self.layer.borderColor = [[UIColor grayColor] CGColor];
    
    int width = self.frame.size.width;
    int height = self.frame.size.height;
    _label = [[UILabel alloc]init];
    UIFont *font = [UIFont fontWithName:@"STHeitiSC-Medium" size:12];
    [_label setFont:font];
    [_label setTextColor:[UIColor colorWithRed:0 green:0.478431 blue:1 alpha:1]];
    _label.frame = CGRectMake(width/2-15, 4, 30, height-8);
    [self addSubview:_label];

}


/*
 *sdfs
 */
- (void)setProgress:(CGFloat)num
{
    if (0<=num&&num<=1)
    {
        int width = self.frame.size.width;
        int height = self.frame.size.height;
        int p = width*num/blockwidth;
        int start = spacewidth;
        for(int i=0;i<p;i++,start+=(blockwidth+spacewidth))
        {
            CGRect prect = CGRectMake(start, 4, blockwidth, height-8);
            
            CAGradientLayer *gradient1 = [CAGradientLayer layer];
            gradient1.frame = prect;
            gradient1.colors = [NSArray arrayWithObjects:(id)[UIColor whiteColor].CGColor,
                                (id)[UIColor greenColor].CGColor,
                                (id)[UIColor whiteColor].CGColor,nil];
            [self.layer insertSublayer:gradient1 atIndex:0];
        }
        int progress = num*100;
        _label.text = [NSString stringWithFormat:@"%d%%",progress];
    }
    else
        return;
}


@end
