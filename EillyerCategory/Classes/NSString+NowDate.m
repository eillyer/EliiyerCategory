//
//  NSString+NowDate.m
//  FriendWay_v_1.0.1
//
//  Created by julong on 16/9/28.
//  Copyright © 2016年 eillyer. All rights reserved.
//

#import "NSString+NowDate.h"

@implementation NSString (NowDate)
+ (instancetype)stringDateNow{
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSDate *date = [NSDate date];
    NSString *dateNow = [formatter stringFromDate:date];
    
    return dateNow;
}
+ (instancetype)stringDateNowFind{
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy-MM";
    NSDate *date = [NSDate date];
    NSString *dateNow = [formatter stringFromDate:date];
    return dateNow;
}


+ (instancetype)stringDateNowTime{
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy-MM-dd-HH-mm-ss";
    NSDate *date = [NSDate date];
    NSString *dateNow = [formatter stringFromDate:date];
    return dateNow;
}


- (NSString *)getStrDateYear{
    
    return [self substringToIndex:4];
}

- (NSString *)getStrDateMonth{
    return [self substringWithRange:NSMakeRange(5, 2)];
}
- (NSString *)getStrDateDay{
    return [self substringWithRange:NSMakeRange(8, 2)];
}

- (NSString *)ZhuanUTF8{
    NSString *url = [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<>+ "].invertedSet];
    return url;
}

- (NSString *)removeNullStrFor:(NSString *)toStr{
    NSString *str = [NSString stringWithFormat:@"%@", self];
    
    return str.length?str:toStr;
}


- (BOOL)stringIsInteger{
    BOOL isF = [self isPureFloat];
    BOOL isI = [self isPureInt];
    return (isF||isI)?YES:NO;
}

//判断字符串是否为浮点数
- (BOOL)isPureFloat{
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}
//判断是否为整形：
- (BOOL)isPureInt{
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}


//对象方法
- (CGSize)sizeOfTextMaxSize:(CGSize)maxSize font:(UIFont *)font{
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
}
//类方法
+ (CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize font:(UIFont *)font{
    return [text sizeOfTextMaxSize:maxSize font:font];
}



//NSDate转NSString
+ (NSString *)stringFromDate:(NSDate *)date
{
    //获取系统当前时间
//    NSDate *currentDate = [NSDate date];
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式：zzz表示时区
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //NSDate转NSString
    NSString *currentDateString = [dateFormatter stringFromDate:date];
    //输出currentDateString
//    NSLog(@"%@",currentDateString);
    return currentDateString;
}

//NSString转NSDate
+ (NSDate *)dateFromString:(NSString *)string
{
    //需要转换的字符串
//    NSString *dateString = @"2015-06-26 08:08:08";
    //设置转换格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //NSString转NSDate
    NSDate *date=[formatter dateFromString:string];
    return date;
}


//汉子转拼音
+ (NSString *)transformToPinyin:(NSString *)aString
{
    
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    NSArray *pinyinArray = [str componentsSeparatedByString:@" "];
    NSMutableString *allString = [NSMutableString new];
    
    //    int count = 0;
    
    //    for (int  i = 0; i < pinyinArray.count; i++)
    //    {
    
    for(int i = 0; i < pinyinArray.count;i++)
    {
        //            if (i == count) {
        //                [allString appendString:@"#"];//区分第几个字母
        //            }
        [allString appendFormat:@"%@",pinyinArray[i]];
        
    }
    //        [allString appendString:@","];
    //        count ++;
    //
    //    }
    
    NSMutableString *initialStr = [NSMutableString new];//拼音首字母
    
    for (NSString *s in pinyinArray)
    {
        if (s.length > 0)
        {
            
            [initialStr appendString:  [s substringToIndex:1]];
        }
    }
    
    //    [allString appendFormat:@"#%@",initialStr];
    //    [allString appendFormat:@",#%@",aString];
    
    return allString;
}


- (NSInteger)starTimeToEndTimeWithHour:(NSString *)endTime{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *star = [dateFormatter dateFromString:self];
    NSDate *end = [dateFormatter dateFromString:endTime];
    
    NSTimeInterval to = [end timeIntervalSinceDate:star];
    
    NSInteger a = to/3600.0;
    
    return a;
    
}


- (NSArray *)strZhuanArr;{
    NSMutableArray <NSString *>* tempMArray = [NSMutableArray new];
    for (int i = 0; i < self.length; i++) {
        NSString *tempString = [self substringWithRange:NSMakeRange(i, 1)];
        [tempMArray addObject:tempString];
    }
    return tempMArray;
}

/*//联系人列表数据重组（1）
 - (void)setMyInfoDict:(NSArray *)arr{
 for (NSDictionary *dict in arr) {
 NSString *a = dict[@"pinyin"];
 NSString *b = [a substringToIndex:1];
 if (![self.FNArr containsObject:b]) {
 [self.FNArr addObject:b];
 }
 }
 for (NSString *name in _FNArr) {
 NSMutableArray *aArr = [NSMutableArray new];
 for (NSDictionary *dict in arr) {
 NSString *a = dict[@"pinyin"];
 if ([a hasPrefix:name]) {
 [aArr addObject:dict];
 }
 }
 self.dict[name] = aArr;
 }
 }
 
 */

-(NSInteger)getCurrentMonthForDays{
    // 创建一个日期类对象(当前月的calendar对象)
    NSCalendar  * calendar = [NSCalendar currentCalendar];
    // NSRange是一个结构体，其中location是一个以0为开始的index，length是表示对象的长度。他们都是NSUInteger类型。
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSString dateFromString:self]];
    NSUInteger numberOfDaysInMonth = range.length;
    return numberOfDaysInMonth;
}



-(NSInteger)getFirstDayWeekForMonth{
    // NSCalendarIdentifierGregorian : 指定日历的算法
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    // NSDateComponents封装了日期的组件,年月日时分秒等(个人感觉像是平时用的model模型)
    // 调用NSCalendar的components:fromDate:方法返回一个NSDateComponents对象
    // 需要的参数分别components:所需要的日期单位 date:目标月份的date对象
    NSDateComponents *comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitWeekday fromDate:[NSString dateFromString:self]];
    //    NSLog(@"NSDateComponents是这个样子的:%@",comps);
    // 直接调用自己weekDay属性
    NSInteger weekday = [comps weekday];
    //#warning mark --找了很多原因不知道为什么星期数总是比实际快一天,有时间找更好的解决方法（暂时用-1天处理了）
    //    weekday--;
    //    NSLog(@"[comps weekday] = %ld",(long)weekday);
    //    if (weekday == 7) {
    //        return 0;
    //    }else return weekday;
    return weekday;
}


@end
