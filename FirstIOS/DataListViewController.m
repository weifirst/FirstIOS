//
//  DataListViewController.m
//  FirstIOS
//
//  Created by weizhenguan on 2017/8/18.
//  Copyright © 2017年 weisoft. All rights reserved.
//

#import "DataListViewController.h"
#import "GenTableView.h"
#import "NewRecordView.h"

@interface DataListViewController ()

@end

@implementation DataListViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
#define NEW_RECORD_HEIGHT 80
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
  //  CGFloat A = self.view.frame.size.height;
  //  CGFloat A1 = self.view.frame.origin.y;
    //CGRect rc = [self relativeFrameForScreenWithView: self.view];
    GenTableView *table = [[GenTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, screenHeight-60-NEW_RECORD_HEIGHT/*+rc.-50*/) style:UITableViewStylePlain];
    
    table.textLabelArray = [[NSMutableArray alloc] initWithObjects:@"235567", @"325667",@"335566",@"349988",@"350345",@"350551",@"A",@"B",@"C",@"D",@"E",@"F",@"G",nil];
    
    table.textDateArray = [[NSMutableArray alloc] initWithObjects:@"0", @"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",nil];
    
    table.estimatedRowHeight = 100;
    table.floatRowHeight = 60;
    NSMutableArray *images = [NSMutableArray array];
    NSMutableArray *subtitle = [NSMutableArray array];

    table.imagesArray = [[NSMutableArray alloc] initWithArray:images];
    table.subtitleArray = [[NSMutableArray alloc] initWithArray:subtitle];
    [self.view addSubview:table];
    
    CGFloat f = table.frame.origin.y+table.frame.size.height;
    NewRecordView *newView = [[NewRecordView alloc] initWithFrame:CGRectMake(0, f, self.view.bounds.size.width, NEW_RECORD_HEIGHT)];
    
    newView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.0];

    
    //newView.backgroundColor = [UIColor colorWithRed:204 green:204 blue:204 alpha:1.0];
    [self.view addSubview:newView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(CGRect)relativeFrameForScreenWithView:(UIView *)v
//{
//    BOOL iOS7 = [[[UIDevice currentDevice] systemVersion] floatValue] >= 7;
//    
//    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
//    if (!iOS7) {
//        screenHeight -= 20;
//    }
//    UIView *view = v;
//    CGFloat x = .0;
//    CGFloat y = .0;
//    while (view.frame.size.width != 320 || view.frame.size.height != screenHeight) {
//        x += view.frame.origin.x;
//        y += view.frame.origin.y;
//        view = view.superview;
//        if ([view isKindOfClass:[UIScrollView class]]) {
//            x -= ((UIScrollView *) view).contentOffset.x;
//            y -= ((UIScrollView *) view).contentOffset.y;
//        }
//    }
//    return CGRectMake(x, y, v.frame.size.width, v.frame.size.height);
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
