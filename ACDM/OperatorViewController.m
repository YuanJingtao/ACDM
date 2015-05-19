//
//  OperatorViewController.m
//  ACDM
//
//  Created by LiJunliang on 15/5/19.
//  Copyright (c) 2015年 wondersgroup. All rights reserved.
//

#import "OperatorViewController.h"

#define ViewTag 10

@interface OperatorViewController ()
@property (weak, nonatomic) IBOutlet UIView *menuView;


@end

@implementation OperatorViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setHidesBackButton:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)planeSearch:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)openMenu:(UIButton *)sender {
    static NSInteger currentMenu = 1;
    
    UIView *curview = [self.view viewWithTag:currentMenu*ViewTag];
    [curview setHidden:YES];
    
    UIView *view = [self.view viewWithTag:[sender tag]*ViewTag];
    [view setHidden:NO];
    currentMenu = [sender tag];
    
}

- (IBAction)popMenu:(UIButton *)sender {
    static BOOL openMenuFlag = YES;
    [self.menuView setHidden:NO];
    if (openMenuFlag) {
        self.menuView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);//将要显示的view按照正常比例显示出来
        [UIView beginAnimations:nil context:UIGraphicsGetCurrentContext()];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut]; //InOut 表示进入和出去时都启动动画
        [UIView setAnimationDuration:0.5f];//动画时间
        self.menuView.transform=CGAffineTransformMakeScale(0.01f, 0.01f);//先让要显示的view最小直至消失
        [UIView commitAnimations]; //启动动画
    }
    else{
        self.menuView.transform = CGAffineTransformMakeScale(0.0f, 0.0f);//将要显示的view按照正常比例显示出来
        [UIView beginAnimations:nil context:UIGraphicsGetCurrentContext()];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut]; //InOut 表示进入和出去时都启动动画
        [UIView setAnimationDuration:0.5f];//动画时间
        self.menuView.transform=CGAffineTransformMakeScale(1.0f, 1.0f);//先让要显示的view最小直至消失
        [UIView commitAnimations]; //启动动画
    }
    openMenuFlag = !openMenuFlag;
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
