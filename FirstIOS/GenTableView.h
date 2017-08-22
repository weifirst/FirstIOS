//
//  GenTableView.h
//  TableView
//
//  Created by wzgmac on 2017/8/3.
//  Copyright © 2017年 weisoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GenTableView : UITableView
@property (nonatomic,assign) CGRect tableViewFrame;
@property (nonatomic,copy) NSMutableArray *textLabelArray;
@property (nonatomic,copy) NSMutableArray *textDateArray;
@property (nonatomic,copy) NSMutableArray *imagesArray;
@property (nonatomic,copy) NSMutableArray *subtitleArray;
@property (nonatomic) CGFloat floatRowHeight;
@end
