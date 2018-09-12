//
//  UIView+layerView.h
//  WeinanApp1
//
//  Created by julong on 2016/11/28.
//  Copyright © 2016年 eillyer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (layerView)



@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat right;



/**
 切圆角和切半角
 
 @param fload 弧度
 @param wid borwid
 @param color borcolor
 
 */
- (void)setR:(CGFloat)fload wid:(CGFloat)wid color:(UIColor *)color;


/**
 @param fload 弧度
 @param wid borwid
 @param color borcolor
 @param corners corners
 */
- (void)setR:(CGFloat)fload wid:(CGFloat)wid color:(UIColor *)color RoundingCorners:(UIRectCorner)corners;



//背景颜色的渐变
- (void)setCAColorClearColorIsH:(BOOL)isH;//渐变透明
- (void)setCAColorStarColor:(UIColor *)starColor endColor:(UIColor *)endColor isH:(BOOL)isH;
- (void)setCAColorStarColor:(UIColor *)starColor endColor:(UIColor *)endColor isH:(BOOL)isH location:(NSNumber *)number;


//背景颜色的渐变BUG修复，每次加载视图时，此视图会被遮挡
- (void)setCAColorStarColor:(UIColor *)starColor endColor:(UIColor *)endColor Tdo:(void(^)(void))doBlock;


/**
 添加阴影

 @param color 阴影颜色
 @param alpha 透明度
 @param x 偏移值x
 @param y 偏移值y
 @param radius 阴影圆弧
 */
- (void)setYinyingColor:(UIColor *)color alpha:(CGFloat)alpha offsetX:(CGFloat)x Y:(CGFloat)y radius:(CGFloat)radius;



//让view左右晃动
- (void)worningShake;




@end
