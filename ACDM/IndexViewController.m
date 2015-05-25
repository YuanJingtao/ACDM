//
//  IndexViewController.m
//  ACDM
//
//  Created by LiJunliang on 15/5/21.
//  Copyright (c) 2015年 wondersgroup. All rights reserved.
//

#import "IndexViewController.h"

@interface IndexViewController ()

@end

@implementation IndexViewController
- (IBAction)segmentChanged:(UISegmentedControl *)sender {
    if ([sender selectedSegmentIndex] == 1) {
        [self performSegueWithIdentifier:@"SelectSegue" sender:nil];
        [sender setSelectedSegmentIndex:0];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置透明
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"topBarBackground.png"] forBarMetrics:UIBarMetricsDefault];
//    //设置
//    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"topBarBackground.png"]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
