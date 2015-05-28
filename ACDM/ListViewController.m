//
//  ListViewController.m
//  ACDM
//
//  Created by LiJunliang on 15/5/20.
//  Copyright (c) 2015年 wondersgroup. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()


@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.array count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    switch (indexPath.row%2) {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:@"PlaneCell1"];
            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:@"PlaneCell2"];
            break;
        default:
            break;
    }
    NSMutableArray *tmparray = [NSMutableArray arrayWithCapacity:9];
    
    for (int i = 1; i<10; i++) {
        UILabel *label = (UILabel*)[cell viewWithTag:i];
        [tmparray addObject:label];
    }
    
    List *list = self.array[indexPath.row];
    
    //日期格式转换
    NSDate *date = [[NSDate alloc]init];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd";
    date = [formatter dateFromString:list.scheduledDate];
    formatter.dateFormat = @"yy/MM/dd";
    list.scheduledDate = [formatter stringForObjectValue:date];
    //时间去除‘-‘字符
    if ([list.thisStationArrivalDt rangeOfString:@"-"].length>0) {
        list.thisStationArrivalDt = [list.thisStationArrivalDt substringWithRange:NSMakeRange(0, list.thisStationArrivalDt.length-1)];
    }

    
    [tmparray[0] setValue:list.state forKey:@"text"];
    [tmparray[1] setValue:list.flightIdentity forKey:@"text"];
    [tmparray[2] setValue:list.aircraftRegistration forKey:@"text"];
    [tmparray[3] setValue:list.standPosition forKey:@"text"];
    [tmparray[4] setValue:list.scheduledDate forKey:@"text"];
    [tmparray[5] setValue:list.thisStationArrivalDt forKey:@"text"];
    [tmparray[6] setValue:list.flightNatureCode forKey:@"text"];
    [tmparray[7] setValue:list.previousStationIataCode forKey:@"text"];
    [tmparray[8] setValue:list.thisStationArrivalDt forKey:@"text"];
    // Configure the cell...
    
    return cell;
}

//点击cell时传递行数
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"DetailSegue" sender:[self.array[indexPath.row] valueForKey:@"id_"]];
}



 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
     UIViewController *vc = [segue destinationViewController];
     [vc setValue:sender forKey:@"id_"];
 }


@end
