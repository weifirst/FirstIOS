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
//    table = [[GenTableView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width/*-20*/, self.view.frame.size.height-20) style:UITableViewStylePlain];
//    table.textLabelArray = [[NSMutableArray alloc] initWithObjects:@"南京市", @"南通市",@"淮安市 \n淮安市qqq 淮安市 bbb淮安市 v a b c d e f",@"镇江市",@"扬州市",@"常州市",nil];
//    table.estimatedRowHeight = 100;
//    NSMutableArray *images = [NSMutableArray array];
//    NSMutableArray *subtitle = [NSMutableArray array];
//    for( NSInteger index=0; index<[table.textLabelArray count]; index++ ){
//        UIImage *image = [UIImage imageNamed:@"face.jpg"];
//        NSString *detail = [NSString stringWithFormat:@"detail text %ld", index+1];
//        [images addObject:image];
//        [subtitle addObject:detail];
//    }
//    table.imagesArray = [[NSMutableArray alloc] initWithArray:images];
//    table.subtitleArray = [[NSMutableArray alloc] initWithArray:subtitle];
    
 //   [self.view addSubview:table];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
