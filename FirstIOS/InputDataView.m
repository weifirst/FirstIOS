//
//  InputDataView.m
//  FirstIOS
//
//  Created by weizhenguan on 2017/8/28.
//  Copyright © 2017年 weisoft. All rights reserved.
//

#import "InputDataView.h"

@implementation InputDataView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (IBAction)ButtonOK:(id)sender
{
    [self endEditing:YES];
    [self setHidden:YES];
}
@end
