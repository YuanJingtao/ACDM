//
//  IndexViewController.m
//  ACDM
//
//  Created by LiJunliang on 15/5/21.
//  Copyright (c) 2015年 wondersgroup. All rights reserved.
//

#import "IndexViewController.h"

@interface IndexViewController ()
- (IBAction)buttonClicked:(UIButton *)sender;
@property  NSDictionary *originText;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollViewLayout;
@property (nonatomic) dispatch_source_t timer;
@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置透明
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"topBarBackground.png"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"topBarBackground.png"]];
    
    self.originText = [self.navigationController.navigationBar titleTextAttributes];
    
    [self.navigationController.navigationBar setTintColor:
     [UIColor  whiteColor]];
    
    //适应scrollView
    self.scrollViewLayout.constant += self.scrollView.frame.size.height/16*16-(int)self.scrollView.frame.size.height/16*16;
    
    
    //gdc循环队列
    dispatch_queue_t queue = dispatch_queue_create("my queue", NULL);
    
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer, dispatch_walltime(DISPATCH_TIME_NOW, 0), 2*NSEC_PER_SEC, 0);
    
    dispatch_source_set_event_handler(_timer, ^{
        int pagesize = (int)(self.scrollView.frame.size.height/16)*16;
        CGPoint position = CGPointMake(0, self.scrollView.contentOffset.y+pagesize);
        if(position.y>self.scrollView.contentSize.height)
        {
            position.y = 0;
        }
        [self.scrollView setContentOffset:position animated:YES];
    });
    dispatch_resume(_timer);
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setTitleTextAttributes:self.originText];
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
- (IBAction)toSearchView:(UIButton *)sender {
    
}
- (IBAction)fiveButtonClick:(UITapGestureRecognizer *)sender {
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc]init];
    [bbi setTitle:@"日运营简报"];
    [self.navigationItem setBackBarButtonItem:bbi];
    [self performSegueWithIdentifier:@"ReportSegue" sender:nil];
}

- (IBAction)buttonClicked:(UIButton *)sender {
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc]init];
    
    switch ([sender tag]) {
        case 1:
            [bbi setTitle:@"航班完成情况"];
            break;
        case 2:
            [bbi setTitle:@"航班正常情况"];
            break;
        case 3:
            [bbi setTitle:@"航班延误情况"];
            break;
        case 4:
            [bbi setTitle:@"航班滞留情况"];
            break;
        case 5:
            [bbi setTitle:@"日运营简报"];
            break;
        case 6:
            [bbi setTitle:@"离港/放行正常情况"];
            break;
        case 7:
            [bbi setTitle:@"进/离港速率"];
            break;
        case 8:
            [bbi setTitle:@"未来一小时"];
            break;
        default:
            break;
    }
    
    [self.navigationItem setBackBarButtonItem:bbi];
}
@end
