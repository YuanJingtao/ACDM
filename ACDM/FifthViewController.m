//
//  FifthViewController.m
//  ACDM
//
//  Created by LiJunliang on 15/5/21.
//  Copyright (c) 2015年 wondersgroup. All rights reserved.
//

#import "FifthViewController.h"

@interface FifthViewController ()
@property (weak, nonatomic) IBOutlet UILabel *view5Label;

@end

@implementation FifthViewController

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

    //init view5
    NSString *labletext = @"\t浦东机场昨日计划xxx架次，\n\t实际执行xxx架次(进港航班xxx架次、出港航班xxx架次；其中，全货机xxx架次、公务机xx架次），\n\t出港旅客(暂无数据)，\n\t放行正常率xxx%；\n\t今日计划xxxx架次，\n\t公务机xx架次，\n\t目前机场适航。\n\t\t2015.xx.xx【浦东AOC】";
    _view5Label.text = labletext;
    
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
