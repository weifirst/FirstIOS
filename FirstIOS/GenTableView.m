//
//  GenTableView.m
//  TableView
//
//  Created by wzgmac on 2017/8/3.
//  Copyright © 2017年 weisoft. All rights reserved.
//

#import "GenTableView.h"
#import "GenTableViewCell.h"
@interface GenTableView()<UITableViewDataSource,UITableViewDelegate>
@end

@implementation GenTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    self.delegate = self;
    self.dataSource = self;
    return self;
}

-(void)setTableViewFrame:(CGRect)tableViewFrame
{
    self.frame = tableViewFrame;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_textLabelArray count];
}

-(UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    GenTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if( !cell ){
        cell = [[GenTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
      
        NSLog(@"%ld", indexPath.row);
    }
    cell.labelDataCount.text = _textLabelArray[indexPath.row];
    cell.labelDate.text = _textDateArray[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _floatRowHeight;
}
@end
