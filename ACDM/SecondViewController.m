//
//  SecondViewController.m
//  ACDM
//
//  Created by LiJunliang on 15/5/21.
//  Copyright (c) 2015年 wondersgroup. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet ProgressBar *view2ProgressBar;

@end

@implementation SecondViewController

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

    //init view2
    [_view2ProgressBar setProgress:0.2];
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
