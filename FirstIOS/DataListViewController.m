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
#import "AppDelegate.h"

@interface DataListViewController ()

@end

@implementation DataListViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
#define NEW_RECORD_HEIGHT 80
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    GenTableView *table = [[GenTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, screenHeight-60-NEW_RECORD_HEIGHT) style:UITableViewStylePlain];
    
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
    
    [self.view addSubview:newView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    //AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    //appDelegate
}

@end
