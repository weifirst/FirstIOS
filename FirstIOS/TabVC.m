//
//  TabVC.m
//  FirstIOS
//
//  Created by weizhenguan on 2017/8/20.
//  Copyright © 2017年 weisoft. All rights reserved.
//

#import "TabVC.h"
#import "DataListViewController.h"
#import "ViewController.h"
#import "InputDataView.h"

@interface TabVC ()

@end

@implementation TabVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSInteger screenWidth = [UIScreen mainScreen].bounds.size.width;
    NSInteger screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    DataListViewController *vcList = [[DataListViewController alloc] init];
    [self addChildViewController:vcList];
    vcList.view.frame = CGRectMake(0, 60, screenWidth, screenHeight);//确保大过屏幕就行
    vcList.view.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:vcList.view];
    [vcList didMoveToParentViewController:self];
    [vcList.view setHidden:NO];
    
    ViewController *vcChart = [[ViewController alloc] init];
    [self addChildViewController:vcChart];
    vcChart.view.frame = CGRectMake(0, 60, screenWidth, screenHeight);
    [self.view addSubview:vcChart.view];
    [vcChart didMoveToParentViewController:self];
    [vcChart.view setHidden:YES];
    
    //加入数据输入界面
    InputDataView *inputView = [[[NSBundle mainBundle] loadNibNamed:@"InputDataView" owner:self options:nil] objectAtIndex:0];

    inputView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    [self.view addSubview:inputView];
    [inputView setHidden:YES];
    
    UIView *btnList = self.view.subviews[0];
    UIView *btnChart = self.view.subviews[1];
    NSInteger btnListWidth = btnList.frame.size.width;
    NSInteger btnChartWidth = btnChart.frame.size.width;
    NSInteger btnHeight = btnList.frame.size.height;
    NSInteger btnTop = btnList.frame.origin.y;
    btnList.frame = CGRectMake((screenWidth/2-btnListWidth)/2, btnTop, btnListWidth, btnHeight);
    btnChart.frame = CGRectMake(screenWidth/2+(screenWidth/2-btnChartWidth)/2, btnTop, btnChartWidth, btnHeight);
   // btnChart.frame = CGRectMake(screenWidth/2+(screenWidth/2-btnWidth)/2, 30, btnWidth, btnHeight);
    
   // [self.childViewControllers[2].view setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnClickList:(id)sender {
    [self.childViewControllers[0].view setHidden:NO];
    [self.childViewControllers[1].view setHidden:YES];
    int a = self.childViewControllers[0].view.frame.size.height;
    int b = self.childViewControllers[1].view.frame.size.height;
    int c = self.childViewControllers[0].view.frame.size.width;
    int d = self.childViewControllers[1].view.frame.size.width;
}
- (IBAction)btnClickChart:(id)sender {
    [self.childViewControllers[0].view setHidden:YES];
    [self.childViewControllers[1].view setHidden:NO];
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
