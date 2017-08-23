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

@interface TabVC ()

@end

@implementation TabVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    DataListViewController *vcList = [[DataListViewController alloc] init];
    [self addChildViewController:vcList];
    vcList.view.frame = CGRectMake(0, 60, 800, 800);
    vcList.view.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:vcList.view];
    [vcList didMoveToParentViewController:self];
    [vcList.view setHidden:NO];
    
    ViewController *vcChart = [[ViewController alloc] init];
    [self addChildViewController:vcChart];
    vcChart.view.frame = CGRectMake(0, 60, 320, 320);
    [self.view addSubview:vcChart.view];
    [vcChart didMoveToParentViewController:self];
    [vcChart.view setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnClickList:(id)sender {
    [self.childViewControllers[0].view setHidden:NO];
    [self.childViewControllers[1].view setHidden:YES];
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
