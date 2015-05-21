//
//  ViewController.m
//  ACDM
//
//  Created by LiJunliang on 15/5/15.
//  Copyright (c) 2015年 wondersgroup. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *detailVIew;
@property (weak, nonatomic) IBOutlet UIView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
- (IBAction)toFirstView:(UIButton *)sender;
- (IBAction)segmentChange:(UISegmentedControl *)sender;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.navigationItem setHidesBackButton:YES];
    _rightButton.layer.borderWidth = 1.0;
    _rightButton.layer.borderColor = [UIColor blackColor].CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchButton:(id)sender {
    static BOOL flag = YES;
    if (flag) {
        [self performSegueWithIdentifier:@"SingleSegue" sender:nil];
    }
    else{
        [self performSegueWithIdentifier:@"ListSegue" sender:nil];
    }
    flag = !flag;
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlaneCell"];
    
    // Configure the cell...
    
    return cell;
}

//点击cell时传递行数
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (IBAction)toFirstView:(UIButton *)sender {
    [self.navigationController popToRootViewControllerAnimated:NO];
}

- (IBAction)segmentChange:(UISegmentedControl *)sender {
    if ([sender selectedSegmentIndex]==0) {
        [self.navigationController popToRootViewControllerAnimated:NO];
        [sender setSelectedSegmentIndex:1];
    }
}
@end
