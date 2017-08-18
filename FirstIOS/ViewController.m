//
//  ViewController.m
//  FirstIOS
//
//  Created by weizhenguan on 2017/8/16.
//  Copyright © 2017年 weisoft. All rights reserved.
//

#import "ViewController.h"
#import "PolylineView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PolylineView *view = [[PolylineView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.view addSubview:view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
