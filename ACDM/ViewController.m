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

@property (weak, nonatomic) IBOutlet UITextField *flightNO;
@property (weak, nonatomic) IBOutlet UITextField *planeNO;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UIView *tableView;

- (IBAction)toFirstView:(UIButton *)sender;

- (IBAction)popDate:(UITapGestureRecognizer *)sender;

- (IBAction)popTime:(id)sender;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *datePickerViewLayout;
- (IBAction)finishButtonClick:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerView;


@property NSMutableArray *array;
@property NSMutableArray *backupArray;
enum {Date=0,Time};

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.navigationItem setHidesBackButton:YES];
    NSDictionary *attributes=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil];
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
    
    
//    //设置查询日期范围
//    NSDateFormatter *format = [[NSDateFormatter alloc]init];
//    [format setDateFormat:@"yyyy-MM-dd"];
//    NSDate *minDate = [[NSDate alloc] initWithTimeIntervalSinceReferenceDate:([[NSDate date] timeIntervalSinceReferenceDate] - 7*24*3600)];
//    //NSLog([format stringFromDate:minDate]);
//    NSDate *maxDate = [[NSDate alloc] initWithTimeIntervalSinceReferenceDate:([[NSDate date] timeIntervalSinceReferenceDate] + 7*24*3600)];
//    //NSLog([format stringFromDate:maxDate]);
//    [self.datePickerView setMinimumDate:minDate];
//    [self.datePickerView setMaximumDate:maxDate];
    
    self.array  = [NSMutableArray array];
    [self loadData];
}

- (void)loadData
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *json = [def valueForKey:@"List"];
    NSData *jsonData = [json dataUsingEncoding: NSUTF8StringEncoding];
    
    NSError *error = nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&error];
    for (NSDictionary *tmp in dic) {
        
        List *list = [[List alloc]init];
        if ([(NSString *)[tmp valueForKey:@"id_"] isKindOfClass:[NSNull class]]) {
            list.flightIdentity = [tmp valueForKey:@"_flightIdentity"];
            list.aircraftRegistration = [tmp valueForKey:@"_aircraftRegistration"];
            list.standPosition = [tmp valueForKey:@"_standPosition"];
            list.scheduledDate = [tmp valueForKey:@"_scheduledDate"];
            list.previousStationIataCode = [tmp valueForKey:@"_previousStationIataCode"];
            list.flightNatureCode = [tmp valueForKey:@"_flightNatureCode"];
            list.thisStationArrivalDt = [tmp valueForKey:@"_thisStationArrivalDt"];
            list.id_ = [tmp valueForKey:@"id"];
            list.state = @"在港";
        }
        else{
            list.flightIdentity = [tmp valueForKey:@"flightIdentity_"];
            list.aircraftRegistration = [tmp valueForKey:@"_aircraftRegistration"];
            list.standPosition = [tmp valueForKey:@"standPosition_"];
            list.scheduledDate = [tmp valueForKey:@"scheduledDate_"];
            list.previousStationIataCode = [tmp valueForKey:@"previousStationIataCode_"];
            list.flightNatureCode = [tmp valueForKey:@"flightNatureCode_"];
            list.thisStationArrivalDt = [tmp valueForKey:@"thisStationArrivalDt_"];
            list.id_ = [tmp valueForKey:@"id"];
            list.state = @"离港";
        }
        //判空
        id listClass = objc_getClass("List");
        unsigned int outCount, i;
        objc_property_t *properties = class_copyPropertyList(listClass, &outCount);
        for (i = 0; i < outCount; i++) {
            objc_property_t property = properties[i];
            NSString *propName = [NSString stringWithUTF8String:property_getName(property)];
            if ([[list valueForKey:propName] isKindOfClass:[NSNull class]]) {
                [list setValue:@"null" forKey:propName];
            }
        }
        
        [self.array addObject:list];
    }
    self.backupArray = self.array;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchButton:(id)sender {
    
    NSPredicate *pre = [NSPredicate predicateWithBlock:^BOOL(List* evaluatedObject, NSDictionary *bindings) {
        if ([self.flightNO.text isEqualToString:@""]||[evaluatedObject.flightIdentity rangeOfString:self.flightNO.text].length>0)
            if ([self.planeNO.text isEqualToString:@""]||[evaluatedObject.aircraftRegistration rangeOfString:self.planeNO.text].length>0)
                if ([evaluatedObject.scheduledDate isEqualToString:self.dateLabel.text])
                    return 1;
        
        
        return 0;
    }];
    self.array = [self.backupArray filteredArrayUsingPredicate:pre];
    //    static BOOL flag = YES;
    //    if (flag) {
    //        [self performSegueWithIdentifier:@"SingleSegue" sender:nil];
    //    }
    //    else{
    //        [self performSegueWithIdentifier:@"ListSegue" sender:nil];
    //    }
    //    flag = !flag;
    [self performSegueWithIdentifier:@"ListSegue" sender:nil];
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

#pragma mark - TextFiled Delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)popDate:(UITapGestureRecognizer *)sender {
    [_datePickerView setDatePickerMode:UIDatePickerModeDate];
    
    // _datePickerView.maximumDate = [NSDate date];
    
    _datePickerViewLayout.constant = 35;
    [UIView animateWithDuration:0.3 animations:^{
        
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
    }];
    currentPickerView = Date;
}

- (IBAction)popTime:(id)sender {
    [_datePickerView setDatePickerMode:UIDatePickerModeTime];
    _datePickerViewLayout.constant = 35;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
    }];
    currentPickerView = Time;
    
}
- (IBAction)touchEdge:(UIControl *)sender {
    [self.flightNO resignFirstResponder];
    [self.planeNO resignFirstResponder];
    
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    ViewController *vc = [segue destinationViewController];
    [vc setValue:self.array forKey:@"array"];
}

@end
