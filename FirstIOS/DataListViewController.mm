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
#import "InputDataView.h"
#import "AppDelegate.h"
#import "Global.h"

@interface DataListViewController ()

@end

@implementation DataListViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
#define NEW_RECORD_HEIGHT 80
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    GenTableView *table = [[GenTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, screenHeight-60-NEW_RECORD_HEIGHT) style:UITableViewStylePlain];
    
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
    
    //加入数据输入界面
    InputDataView *inputView = [[[NSBundle mainBundle] loadNibNamed:@"InputDataView" owner:self options:nil] objectAtIndex:0];
    //[inputView setHidden:false];
    [self.view addSubview:inputView];
    
    [self.view.subviews[2] setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    ((GenTableView*)self.view.subviews[0]).LoadData;
}


@end
