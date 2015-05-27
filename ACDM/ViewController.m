//
//  ViewController.m
//  ACDM
//
//  Created by LiJunliang on 15/5/15.
//  Copyright (c) 2015年 wondersgroup. All rights reserved.
//

#import "ViewController.h"

static int currentPickerView;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *tableView;

- (IBAction)toFirstView:(UIButton *)sender;

- (IBAction)popDate:(UITextField *)sender;
- (IBAction)popTime:(UITextField *)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *datePickerViewLayout;
- (IBAction)finishButtonClick:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerView;
@property (weak, nonatomic) IBOutlet UITextField *dateLabel;
@property (weak, nonatomic) IBOutlet UITextField *timeLabel;

enum {Date=0,Time};

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.navigationItem setHidesBackButton:YES];
    NSDictionary *attributes=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil];
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
}

- (void)loadData
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *json = [def valueForKey:@"Json"];
    NSData *jsonData = [json dataUsingEncoding: NSUTF8StringEncoding];
    
    NSError *error = nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&error];
    
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



- (IBAction)popDate:(UITextField *)sender {
    [_datePickerView setDatePickerMode:UIDatePickerModeDate];
    
   // _datePickerView.maximumDate = [NSDate date];
    
    _datePickerViewLayout.constant = 35;
    [UIView animateWithDuration:0.3 animations:^{
        
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
    }];
    currentPickerView = Date;
}

- (IBAction)popTime:(UITextField *)sender {
    [_datePickerView setDatePickerMode:UIDatePickerModeTime];
    _datePickerViewLayout.constant = 35;
    [UIView animateWithDuration:0.3 animations:^{
        
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
    }];
    currentPickerView = Time;

}
- (IBAction)finishButtonClick:(UIBarButtonItem *)sender {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    if (currentPickerView == Date) {
        [formatter setDateFormat:@"yyyy-MM-dd"];
        _dateLabel.text = [formatter stringFromDate:_datePickerView.date];
        
    }
    else
    {
        [formatter setDateFormat:@"HH:mm"];
        _timeLabel.text = [formatter stringFromDate:_datePickerView.date];
    }
    _datePickerViewLayout.constant = -300;
    [UIView animateWithDuration:0.3 animations:^{
        
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
    }];
}
@end
