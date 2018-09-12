//
//  NSDictionary+dictJson.m
//  FriendWay_v_1.0.1
//
//  Created by julong on 2016/11/10.
//  Copyright © 2016年 eillyer. All rights reserved.
//

#import "NSDictionary+dictJson.h"

@implementation NSDictionary (dictJson)

/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    
    
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}



+ (NSString*)dictionaryToJson:(NSDictionary *)dic{
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    

}



- (NSDictionary *)deleteAllNullValue{
    NSMutableDictionary *mutableDic = [[NSMutableDictionary alloc] init];
    for (NSString *keyStr in self.allKeys) {
        if ([[self objectForKey:keyStr] isEqual:[NSNull null]]) {
            [mutableDic setObject:@"" forKey:keyStr];
        }
        else{
            [mutableDic setObject:[self objectForKey:keyStr] forKey:keyStr];
        }
    }
    return mutableDic;
}

/*
 #import <objc/runtime.h>
 
 //获取对象的所有属性
 - (NSArray *)getAllProperties
 {
 u_int count;
 objc_property_t *properties  =class_copyPropertyList([self class], &count);
 NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
 for (int i = 0; i<count; i++)
 {
 const char* propertyName =property_getName(properties[i]);
 [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
 }
 free(properties);
 return propertiesArray;
 }
 
 //Model 到字典
 - (NSDictionary *)properties_aps
 {
 NSMutableDictionary *props = [NSMutableDictionary dictionary];
 unsigned int outCount, i;
 objc_property_t *properties = class_copyPropertyList([self class], &outCount);
 for (i = 0; i<outCount; i++)
 {
 objc_property_t property = properties[i];
 const char* char_f =property_getName(property);
 NSString *propertyName = [NSString stringWithUTF8String:char_f];
 id propertyValue = [self valueForKey:(NSString *)propertyName];
 if (propertyValue) [props setObject:propertyValue forKey:propertyName];
 }
 free(properties);
 return props;
 }
 */


@end
