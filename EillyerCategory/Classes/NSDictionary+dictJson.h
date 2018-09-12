//
//  NSDictionary+dictJson.h
//  FriendWay_v_1.0.1
//
//  Created by julong on 2016/11/10.
//  Copyright © 2016年 eillyer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (dictJson)
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;//json转字典
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;//字典转json字符串
/**
 字典的值排空处理

 @return 正常字典
 */
- (NSDictionary *)deleteAllNullValue;
@end
