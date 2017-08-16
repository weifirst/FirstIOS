//
//  PolylineView.m
//  FirstIOS
//
//  Created by weizhenguan on 2017/8/16.
//  Copyright © 2017年 weisoft. All rights reserved.
//

#import "PolylineView.h"

@implementation PolylineView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //self.backgroundColor = [UIColor clearColor];
    //[super drawRect:rect];
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBFillColor(context, 255, 255, 255, 1);
    CGContextFillRect(context, rect);
    
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 3);
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetRGBStrokeColor(context, 70.0/255.0, 241.0/255.0, 241.0/255.0, 1.0);
    CGContextBeginPath(context);
    
     CGRect rcStatusBar = [[UIApplication sharedApplication] statusBarFrame];
    CGContextMoveToPoint(context, 0, rcStatusBar.size.height);
    CGContextAddLineToPoint(context, self.frame.size.width, self.frame.size.height);
    
    CGContextStrokePath(context);
    
    //CGContextAddRect(context, CGRectMake(0, 0, 100, 100));
//    CGContextSetRGBFillColor(context, 1, 1, 111, 1.0);
//    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:15.0f];
//    UIColor *redColor = [UIColor redColor];
//    
//    [self drawInRect]
}


@end
