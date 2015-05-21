//
//  ThirdViewController.m
//  ACDM
//
//  Created by LiJunliang on 15/5/21.
//  Copyright (c) 2015年 wondersgroup. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
@property (weak, nonatomic) IBOutlet PillarGraph *view3PillarGraph;

@end

@implementation ThirdViewController

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

    //init view3
    NSArray *hSet = [NSArray arrayWithObjects:[NSNumber numberWithInt:70],[NSNumber numberWithInt:8],[NSNumber numberWithInt:50],[NSNumber numberWithInt:60],[NSNumber numberWithInt:70], nil];
    _view3PillarGraph.intArray = hSet;
    
    [_view3PillarGraph setNeedsDisplay];

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
