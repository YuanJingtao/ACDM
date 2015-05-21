//
//  FourthViewController.m
//  ACDM
//
//  Created by LiJunliang on 15/5/21.
//  Copyright (c) 2015年 wondersgroup. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()
@property (weak, nonatomic) IBOutlet Gauge *view4Gauge;
@property (weak, nonatomic) IBOutlet PillarGraph *view4PillarGraph;

@end

@implementation FourthViewController

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

    //init view4
    [_view4Gauge setNum:1];
    NSArray *hSet2 = [NSArray arrayWithObjects:[NSNumber numberWithInt:100],[NSNumber numberWithInt:70],[NSNumber numberWithInt:33],[NSNumber numberWithInt:50],[NSNumber numberWithInt:100], nil];
    _view4PillarGraph.intArray = hSet2;
    
    [_view4PillarGraph setNeedsDisplay];
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
