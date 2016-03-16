//
//  UIView+Extension.m
//  Ayibang
//
//  Created by 阿姨帮 on 15/7/8.
//  Copyright (c) 2015年 ayibang. All rights reserved.
//

#import "UIView+Extension.h"
@implementation UIView (Extension)

#pragma mark - 便捷修改，访问UIView的frame属性的分类 ConvenienceFrame
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}
- (CGFloat)maxX{
    return CGRectGetMaxX(self.frame);
}
- (CGFloat)maxY{
    return CGRectGetMaxY(self.frame);
}

#pragma mark - 根据屏幕尺寸计算相应的等比例宽高值
+ (float)setWidth:(float)width{
    float width1=(float)width;
    float width2=width1/320;
    return width2*[UIScreen mainScreen].bounds.size.width;
}
+ (float)setHeight:(float)height{
    float height1=height;
    float height2=height1/568;
    return height2*[UIScreen mainScreen].bounds.size.height;
    
}
+ (CGRect)setFrame:(CGRect)frame{
    float a=[UIView setWidth:frame.origin.x];
    float b=[UIView setHeight:frame.origin.y];
    float c=[UIView setWidth:frame.size.width];
    float d=[UIView setHeight:frame.size.height];
    CGRect frame1=CGRectMake(a, b, c, d);
    return frame1;
    
}


#pragma mark - 获取视图的控制器
- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

- (void)allBtnSetExclusiveTouch{
    for (UIView * v in [self subviews]) {
        if([v isKindOfClass:[UIButton class]])
            [((UIButton *)v) setExclusiveTouch:YES];
        else if ([v isKindOfClass:[UIView class]]){
            [v allBtnSetExclusiveTouch];
        }
    }
}

- (void)ext_removeAllSubviews{
    NSInteger count = self.subviews.count;
    for (int i=0; i<count; i++) {
        UIView *subview = [self.subviews firstObject];
        [subview removeFromSuperview];
    }
}
@end
