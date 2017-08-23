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
    return m_vvData.size();
}

-(UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Users/wzg/Library/Developer/CoreSimulator/Devices/46EE7734-2C90-4CC5-8649-CFA88860DAEB/data/Containers/Data/Application/F7DB83F2-384E-4D6F-AF89-ACBFC6A194E0/Documents/
    static NSString *ID = @"cell";
    GenTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if( !cell ){
        cell = [[GenTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
      
        NSLog(@"%ld", indexPath.row);
    }
    cell.labelDataCount.text = m_vvData[indexPath.row][1];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[m_vvData[indexPath.row][2] doubleValue]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init]; [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *sTime = [formatter stringFromDate:date];
    

    cell.labelDate.text = sTime;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _floatRowHeight;
}

-(void)LoadData
{
    m_vvData.clear();
    GetDBData(@"SELECT ID,count,date FROM FundInfo", m_vvData);
}

@end
