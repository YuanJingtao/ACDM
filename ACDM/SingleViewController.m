//
//  SingleViewController.m
//  ACDM
//
//  Created by LiJunliang on 15/5/20.
//  Copyright (c) 2015年 wondersgroup. All rights reserved.
//

#import "SingleViewController.h"

@interface SingleViewController ()
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
- (IBAction)toFirstView:(UIButton *)sender;

@end

@implementation SingleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _rightButton.layer.borderWidth = 1.0;
    _rightButton.layer.borderColor = [UIColor blackColor].CGColor;
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

- (IBAction)toFirstView:(UIButton *)sender {
    [self.navigationController popToRootViewControllerAnimated:NO];
}
@end
