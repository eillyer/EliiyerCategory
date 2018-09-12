//
//  NSArray+array.h
//  FriendWay_v_1.0.1
//
//  Created by julong on 2016/11/9.
//  Copyright © 2016年 eillyer. All rights reserved.
//

#import <Foundation/Foundation.h>

//typedef NS_ENUM(NSInteger,typeUpAndDown) {
//    up,
//    down
//};




@interface NSArray (array)
//@property (nonatomic,assign) typeUpAndDown type;

- (NSString *)arrToJsonString;//将数组转为json字符串
+ (NSArray *)arrFromJsonString:(NSString *)jsonString;//json转数组


- (NSArray *)paixuUp:(NSArray *)sender forKey:(NSString *)key up:(BOOL)isUp;//排序根据key的字符串


//字典数组，根据字典中的某个键，将数组进行排序
- (NSArray *)paixuUpforKey:(NSString *)key up:(BOOL)isUp;//排序根据key的字符串

- (NSArray *)lookDictForKey:(NSString *)key;//根据给出的key得到value的数组


/**
 字符串数组的查询
 
 @param value 匹配字符
 @return 数组
 */
- (NSArray *)returnArrWithString:(NSString *)value;


/**
 普通查询
 
 @param key 键
 @param value 匹配字符
 @return 数组
 */
- (NSArray *)returnArrWithTypekey:(NSString *)key value:(NSString *)value;//根据数组中字典的键值来筛选数组
/**
 搜索使用的模糊查询
 
 @param key 字典的键
 @param value 匹配的字符
 @return 筛选出的数组
 */
- (NSArray *)returnArrWithTypeSearchKey:(NSString *)key value:(NSString *)value;//根据数组中字典的键值来筛选数组

@end
