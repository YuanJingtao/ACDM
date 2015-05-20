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
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIView *menuView;

@property (weak, nonatomic) IBOutlet UILabel *view5Label;

@property (weak, nonatomic) IBOutlet Gauge *view1Gauge;
@property (weak, nonatomic) IBOutlet ProgressBar *view1ProgressBar;
@property (weak, nonatomic) IBOutlet ProgressBar *view1ProgressBar2;
@property (weak, nonatomic) IBOutlet ProgressBar *view2ProgressBar;
@property (weak, nonatomic) IBOutlet PillarGraph *view3PillarGraph;
@property (weak, nonatomic) IBOutlet Gauge *view4Gauge;
@property (weak, nonatomic) IBOutlet PillarGraph *view4PillarGraph;
@property (weak, nonatomic) IBOutlet Gauge *view7Gauge;
@property (weak, nonatomic) IBOutlet Gauge *view7Gauge2;


@end

@implementation OperatorViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _leftButton.layer.borderWidth = 1.0;
    _leftButton.layer.borderColor = [UIColor blackColor].CGColor;
}

//控件初值设置写到这里
-(void)viewDidAppear:(BOOL)animated
{
    //init view1
    [_view1Gauge setNum:0.5];
    [_view1ProgressBar setProgress:0.76];
    [_view1ProgressBar2 setProgress:0.4];
    //init view2
    [_view2ProgressBar setProgress:0.2];
    //init view3
    NSArray *hSet = [NSArray arrayWithObjects:[NSNumber numberWithInt:70],[NSNumber numberWithInt:8],[NSNumber numberWithInt:50],[NSNumber numberWithInt:60],[NSNumber numberWithInt:70], nil];
    _view3PillarGraph.intArray = hSet;
    
    [_view3PillarGraph setNeedsDisplay];
    //init view4
    [_view4Gauge setNum:1];
    NSArray *hSet2 = [NSArray arrayWithObjects:[NSNumber numberWithInt:100],[NSNumber numberWithInt:70],[NSNumber numberWithInt:33],[NSNumber numberWithInt:50],[NSNumber numberWithInt:100], nil];
    _view4PillarGraph.intArray = hSet2;
    
    [_view4PillarGraph setNeedsDisplay];
    //init view5
    NSString *labletext = @"\t浦东机场昨日计划xxx架次，\n\t实际执行xxx架次(进港航班xxx架次、出港航班xxx架次；其中，全货机xxx架次、公务机xx架次），\n\t出港旅客(暂无数据)，\n\t放行正常率xxx%；\n\t今日计划xxxx架次，\n\t公务机xx架次，\n\t目前机场适航。\n\t\t2015.xx.xx【浦东AOC】";
    _view5Label.text = labletext;
    
    //init view6
    //init view7
    [_view7Gauge setNum:0.2];
    [_view7Gauge2 setNum:0.5];
    //init view8
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)planeSearch:(UIButton *)sender {
    // [self.navigationController popViewControllerAnimated:YES];
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
