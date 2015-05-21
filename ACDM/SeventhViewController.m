//
//  SeventhViewController.m
//  ACDM
//
//  Created by LiJunliang on 15/5/21.
//  Copyright (c) 2015年 wondersgroup. All rights reserved.
//

#import "SeventhViewController.h"

@interface SeventhViewController ()
@property (weak, nonatomic) IBOutlet Gauge *view7Gauge;
@property (weak, nonatomic) IBOutlet Gauge *view7Gauge2;

@end

@implementation SeventhViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//控件初值设置写到这里
-(void)viewDidAppear:(BOOL)animated
{

    //init view7
    [_view7Gauge setNum:0.2];
    [_view7Gauge2 setNum:0.5];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
