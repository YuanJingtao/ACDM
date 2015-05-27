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
    return 10;
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
    
    // Configure the cell...
    
    return cell;
}

//点击cell时传递行数
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"DetailSegue" sender:nil];
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
