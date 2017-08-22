//
//  GenTableViewCell.h
//  TableView
//
//  Created by wzgmac on 2017/8/4.
//  Copyright © 2017年 weisoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GenTableViewCell : UITableViewCell
@property (nonatomic) UILabel *labelDataCount;
@property (nonatomic) UILabel *labelDate;
- (UIViewController *)getCurrentVC;

@end
