//
//  UIView+layerView.m
//  WeinanApp1
//
//  Created by julong on 2016/11/28.
//  Copyright © 2016年 eillyer. All rights reserved.
//

#import "UIView+layerView.h"

@implementation UIView (layerView)
- (void)setR:(CGFloat)fload wid:(CGFloat)wid color:(UIColor *)color{
    
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = wid;
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = fload;
    
}


- (void)setR:(CGFloat)fload wid:(CGFloat)wid color:(UIColor *)color RoundingCorners:(UIRectCorner)corners{
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(fload, fload)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    self.clipsToBounds = YES;
    
    
    //    类型共有以下几种:
    //
    //    * UIRectCornerTopLeft
    //
    //    * UIRectCornerTopRight
    //
    //    * UIRectCornerBottomLeft
    //
    //    * UIRectCornerBottomRight
    //
    //    * UIRectCornerAllCorners
    //
    
}


- (void)setCAColorStarColor:(UIColor *)starColor endColor:(UIColor *)endColor isH:(BOOL)isH location:(NSNumber *)number{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)starColor.CGColor, (__bridge id)endColor.CGColor, (__bridge id)[UIColor blueColor].CGColor];
    gradientLayer.locations = @[number, @1];
    if (isH) {
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(0, 1.0);
    }else{
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(1.0, 0);
    }
    gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
    gradientLayer.frame = CGRectMake(0, 0, self.frame.size.width, CGRectGetHeight(self.bounds));
    [self.layer insertSublayer:gradientLayer atIndex:0];
}


- (void)setCAColorClearColorIsH:(BOOL)isH{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    NSArray *colors = [NSArray arrayWithObjects:
                       (id)[[UIColor colorWithWhite:0 alpha:0.5] CGColor],
                       (id)[[UIColor colorWithWhite:0 alpha:0.2] CGColor],
                       (id)[[UIColor colorWithWhite:0 alpha:0] CGColor],
                       nil];
    [gradientLayer setColors:colors];
    //渐变起止点，point表示向量
    gradientLayer.locations = @[@0.1, @0.3,@0.6];
    if (isH) {
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(0, 1.0);
    }else{
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(1.0, 0);
    }
    [gradientLayer setFrame:self.bounds];
    
    [self.layer setMask:gradientLayer];
    
}

- (void)setCAColorStarColor:(UIColor *)starColor endColor:(UIColor *)endColor isH:(BOOL)isH{
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)starColor.CGColor, (__bridge id)endColor.CGColor, (__bridge id)[UIColor blueColor].CGColor];
    gradientLayer.locations = @[@0.5, @1];
    if (isH) {
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(0, 1.0);
    }else{
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(1.0, 0);
    }

//    gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
    gradientLayer.frame = CGRectMake(0, 0, self.frame.size.width, CGRectGetHeight(self.bounds));

    [self.layer insertSublayer:gradientLayer atIndex:0];
//    self.layer = [[CALayer alloc] initWithLayer:gradientLayer];
//    [self.layer replaceSublayer:gradientLayer with:self.layer];
//    [self.layer removeFromSuperlayer];
}

- (void)setCAColorStarColor:(UIColor *)starColor endColor:(UIColor *)endColor Tdo:(void(^)(void))doBlock{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)starColor.CGColor, (__bridge id)endColor.CGColor, (__bridge id)[UIColor blueColor].CGColor];
    gradientLayer.locations = @[@0.3, @1];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    //    gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
    gradientLayer.frame = CGRectMake(0, 0, self.frame.size.width, CGRectGetHeight(self.bounds));
    
    [self.layer insertSublayer:gradientLayer atIndex:0];
//    doBlock();
}

- (void)worningShake{
    CAKeyframeAnimation *kfa = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    
    CGFloat s = 5;
    
    kfa.values = @[@(-s),@(0),@(s),@(0),@(-s),@(0),@(s),@(0)];
    
    //时长
    kfa.duration = 0.2;
    
    //重复
    kfa.repeatCount = 2;
    
    //移除
    kfa.removedOnCompletion = YES;
    
    [self.layer addAnimation:kfa forKey:@"shake"];
}

- (void)setYinyingColor:(UIColor *)color alpha:(CGFloat)alpha offsetX:(CGFloat)x Y:(CGFloat)y radius:(CGFloat)radius{
    self.layer.shadowColor = color.CGColor;//设置阴影的颜色

    self.layer.shadowOpacity = alpha;//设置阴影的透明度
    
    self.layer.shadowOffset = CGSizeMake(x, y);//设置阴影的偏移量
    
    self.layer.shadowRadius = radius;//设置阴影的圆角
}








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

- (void)setBottom:(CGFloat)bottom{
    //没有实际意义，取消警告

}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setRight:(CGFloat)right{
    //没有实际意义，取消警告
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}


@end
