//
//  NSString+NowDate.h
//  FriendWay_v_1.0.1
//
//  Created by julong on 16/9/28.
//  Copyright © 2016年 eillyer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (NowDate)
+ (instancetype)stringDateNow;//当前日期yyyy-MM-dd
+ (instancetype)stringDateNowFind;//当前月yyyy-MM
+ (instancetype)stringDateNowTime;//当前具体时间yyyy-MM-dd-HH-mm-ss

- (NSString *)getStrDateYear;//得到年
- (NSString *)getStrDateMonth;//得到月
- (NSString *)getStrDateDay;//得到日

/**
 时间段计算出小时
 
 self 为开始时间
 @param endTime 结束时间
 @return 距离多少小时
 */
- (NSInteger)starTimeToEndTimeWithHour:(NSString *)endTime;

- (NSString *)ZhuanUTF8 NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, "过期提醒");//格式转换


- (NSString *)removeNullStrFor:(NSString *)toStr;//排空处理


- (BOOL)stringIsInteger;//判断字符串是否是数字


//直接可以通过传入的字符串 和给定的最大 size 和字体的大小 计算出 自适应后的 size
//对象方法

- (CGSize)sizeOfTextMaxSize:(CGSize)maxSize font:(UIFont *)font;
////类方法
+ (CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize font:(UIFont *)font;


//NSDate转NSString
+ (NSString *)stringFromDate:(NSDate *)date;
//NSString转NSDate
+ (NSDate *)dateFromString:(NSString *)string;

/**
 汉子转拼音
 
 @param aString 拼音
 @return 返回
 */
+ (NSString *)transformToPinyin:(NSString *)aString;


/*
 根据字符串直接转成数组
 
 直接字符串  如：@“asdf”
 转为@[@"a",@"s",@"d",@"f"]
 */
- (NSArray *)strZhuanArr;

//获取当前月份有多少天yyyy-MM
-(NSInteger)getCurrentMonthForDays;

//获取某个月的1号是星期几(必不可少的一个方法，用来布局UI使每月1号与星期队形起来
-(NSInteger)getFirstDayWeekForMonth;
@end
