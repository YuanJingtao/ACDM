//
//  DrawViewController.m
//  ACDM
//
//  Created by LiJunliang on 15/5/15.
//  Copyright (c) 2015年 wondersgroup. All rights reserved.
//

#import "DrawViewController.h"

@interface DrawViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DrawViewController

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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 1: case 3: case 5: case 7:
            return 131;
            break;
        case 2: case 4: case 6: case 8:
            return 121;
            break;
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    // Configure the cell...
    switch (indexPath.row) {
        case 1: case 3: case 5: case 7:
            cell = [tableView dequeueReusableCellWithIdentifier:@"PlaneFinishCell"];
            break;
        case 2: case 4: case 6: case 8:
            cell = [tableView dequeueReusableCellWithIdentifier:@"ArrivePortCell"];
            break;
        default:
            cell = [tableView dequeueReusableCellWithIdentifier:@"PlaneFinishCell"];
            break;
    }
    return cell;
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
