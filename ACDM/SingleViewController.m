//
//  SingleViewController.m
//  ACDM
//
//  Created by LiJunliang on 15/5/20.
//  Copyright (c) 2015年 wondersgroup. All rights reserved.
//

#import "SingleViewController.h"

@interface SingleViewController ()


@end

@implementation SingleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 异步下载
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //第一步，创建URL
        
        NSURL *url = [NSURL URLWithString:@"http://10.1.44.39:8080/acdm/fpm/flightDetail.getData.do"];
        
        //第二步，创建请求
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
        
        [request setHTTPMethod:@"POST"];//设置请求方式为POST，默认为GET
        
        NSString *str = [NSString stringWithFormat:@"id=%@",self.id_];//设置参数
        NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
        
        [request setHTTPBody:data];
        
        //第三步，连接服务器
        NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSString *str1 = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
        
        // 回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            NSData *jsonData = [str1 dataUsingEncoding:NSUTF8StringEncoding];
            NSError *error = nil;
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&error];
            
            
        });
    });
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
