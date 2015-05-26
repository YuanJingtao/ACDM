//
//  IndexViewController.m
//  ACDM
//
//  Created by LiJunliang on 15/5/21.
//  Copyright (c) 2015年 wondersgroup. All rights reserved.
//

#import "IndexViewController.h"

@interface IndexViewController ()
- (IBAction)buttonClicked:(UIButton *)sender;


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
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"topBarBackground.png"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"topBarBackground.png"]];
    
    
    
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

- (IBAction)buttonClicked:(UIButton *)sender {
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc]init];
    
    [self.navigationController.navigationBar setTintColor:[UIColor  whiteColor]];
    
    switch ([sender tag]) {
        case 1:
            [bbi setTitle:@"航班完成情况"];
            break;
        case 2:
            [bbi setTitle:@"航班正常情况"];
            break;
        case 3:
            [bbi setTitle:@"航班延误情况"];
            break;
        case 4:
            [bbi setTitle:@"航班滞留情况"];
            break;
        case 5:
            [bbi setTitle:@"日运营简报"];
            break;
        case 6:
            [bbi setTitle:@"离港/放行正常情况"];
            break;
        case 7:
            [bbi setTitle:@"进/离港速率"];
            break;
        case 8:
            [bbi setTitle:@"未来一小时态势"];
            break;
        default:
            break;
    }
    
    
    [self.navigationItem setBackBarButtonItem:bbi];
}
@end
