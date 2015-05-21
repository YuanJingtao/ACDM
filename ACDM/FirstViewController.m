//
//  FirstViewController.m
//  ACDM
//
//  Created by LiJunliang on 15/5/21.
//  Copyright (c) 2015年 wondersgroup. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet Gauge *view1Gauge;
@property (weak, nonatomic) IBOutlet ProgressBar *view1ProgressBar;
@property (weak, nonatomic) IBOutlet ProgressBar *view1ProgressBar2;

@end

@implementation FirstViewController

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
    //init view1
    [_view1Gauge setNum:0.5];
    [_view1ProgressBar setProgress:0.76];
    [_view1ProgressBar2 setProgress:0.4];
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
