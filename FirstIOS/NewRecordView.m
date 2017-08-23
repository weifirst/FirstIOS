//
//  NewRecordView.m
//  FirstIOS
//
//  Created by weizhenguan on 2017/8/21.
//  Copyright © 2017年 weisoft. All rights reserved.
//

#import "NewRecordView.h"

@implementation NewRecordView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    int nToLeft = 100;
    int nToTop = 20;
    button.frame = CGRectMake(nToLeft, nToTop, self.frame.size.width-2*nToLeft, self.frame.size.height-2*nToTop);
    [button setTitle: @"新建" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:18.0f];
    button.backgroundColor = [UIColor colorWithRed:139.0/255 green:178.0/255 blue:38.0/255 alpha:1];
    button.layer.cornerRadius = button.frame.size.height/2;
    
   
    
    [self addSubview:button];
    
     [button addTarget:self action:@selector(pressBtnNew) forControlEvents:UIControlEventTouchUpInside];
    
    return self;
}

-(void)pressBtnNew
{
    
}

//-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    return self;
//}

//-(void)RegisterBtnClick:(UIViewController*)vc
//{
//    [((UIButton*)self.subviews[0]) addTarget:vc action:@selector(vc.pressBtnNew) forControlEvents:UIControlEventTouchUpInside];
//}

@end
