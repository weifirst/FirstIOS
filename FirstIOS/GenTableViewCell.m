//
//  GenTableViewCell.m
//  TableView
//
//  Created by wzgmac on 2017/8/4.
//  Copyright © 2017年 weisoft. All rights reserved.
//

#import "GenTableViewCell.h"
#import "GenTableView.h"
//#import "SecondViewController.h"

@implementation GenTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if( self ){
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(320, 20, 50, 50);
        [button setTitle:@"Yes" forState:UIControlStateNormal];
        [button setTitle:@"No" forState:UIControlStateSelected];
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        _labelDataCount = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 20)];
        [self addSubview:_labelDataCount];
        
        _labelDate = [[UILabel alloc] initWithFrame:CGRectMake(120, 10, 100, 20)];
        [self addSubview:_labelDate];
    }
    
    return self;
}

-(void)buttonPressed:(UIButton *)button
{
    button.selected = !button.selected;
}

- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

@end
