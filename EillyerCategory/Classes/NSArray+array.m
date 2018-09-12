//
//  NSArray+array.m
//  FriendWay_v_1.0.1
//
//  Created by julong on 2016/11/9.
//  Copyright © 2016年 eillyer. All rights reserved.
//

#import "NSArray+array.h"

#import "NSString+NowDate.h"
@implementation NSArray (array)
- (NSString *)arrToJsonString{
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return str;
}

- (NSArray *)paixuUp:(NSArray *)sender forKey:(NSString *)key up:(BOOL)isUp{
    
    NSMutableArray *arr = [NSMutableArray new];
    
    //1版，没有排除value为空的情况
    for (NSDictionary *dict in sender) {
        [arr addObject:dict[key]];
    }
    
    //2，排除空的
//    for (NSMutableDictionary *dict in sender) {
//        NSString *str = dict[key];
//        
//        if (!str.length) {
//            
////            dict[key] = @"0000-00-00 00:00:00.0";
//            [dict setObject:@"0000-00-00 00:00:00.0" forKey:key];
//        }
//        [arr addObject:dict[key]];
//
//    }
    
    

    NSArray * arraySorted = [arr sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];

    NSMutableArray *OKarr = [NSMutableArray new];
    
    for (int i = 0; i < arraySorted.count; i++) {
        for (int j = 0; j < sender.count; j++) {
            NSDictionary *dic = [NSDictionary dictionaryWithDictionary:sender[j]];
            if ([dic[key] isEqualToString:arraySorted[i]]) {
                [OKarr addObject:sender[j]];
            }
        }
    }
    
    if (isUp) {
        return OKarr;
    }else{
        return [[OKarr reverseObjectEnumerator] allObjects];
    }
}



- (NSArray *)paixuUpforKey:(NSString *)key up:(BOOL)isUp{
    NSMutableArray *arr = [NSMutableArray new];
    //1版，没有排除value为空的情况
    for (NSDictionary *dict in self) {
        [arr addObject:dict[key]];
    }
    
    //2，排除空的
    //    for (NSMutableDictionary *dict in sender) {
    //        NSString *str = dict[key];
    //
    //        if (!str.length) {
    //
    ////            dict[key] = @"0000-00-00 00:00:00.0";
    //            [dict setObject:@"0000-00-00 00:00:00.0" forKey:key];
    //        }
    //        [arr addObject:dict[key]];
    //
    //    }
    NSArray * arraySorted = [arr sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    NSMutableArray *OKarr = [NSMutableArray new];
    for (int i = 0; i < arraySorted.count; i++) {
        for (int j = 0; j < self.count; j++) {
            NSDictionary *dic = [NSDictionary dictionaryWithDictionary:self[j]];
            if ([dic[key] isEqualToString:arraySorted[i]]) {
                [OKarr addObject:self[j]];
            }
        }
    }
    if (isUp) {
        return OKarr;
    }else{
        return [[OKarr reverseObjectEnumerator] allObjects];
    }
}


+ (NSArray *)arrFromJsonString:(NSString *)jsonString{
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:jsonData
                                                   options:NSJSONReadingMutableContainers
                                                     error:&err];
    if(err) {
        NSLog(@"json转数组解析失败：%@",err);
        return nil;
    }
    return arr;
}



- (NSArray *)lookDictForKey:(NSString *)key{
    NSMutableArray *arr = [NSMutableArray new];
    for (NSDictionary *dict in self) {
        [arr addObject:dict[key]];
    }
    return arr;
}



- (NSArray *)returnArrWithString:(NSString *)value{
    
    NSMutableArray *a = [NSMutableArray new];
    NSString *str = [value lowercaseString];//小写
    NSArray *arr = [str strZhuanArr];
    
    for (NSString *strs in self) {
        NSString *tempstr = [NSString transformToPinyin:strs] ;
        NSArray *arr2 = [tempstr strZhuanArr];
        //第一版
        int j = 0;
        for (int i = 0; i < arr2.count; i++) {
            if ([arr2[i] isEqualToString:arr[j]]) {
                if (j==(arr.count-1)) {
                    [a addObject:strs];
                    break;
                }
                j++;
            }
        }
    }
    return a;
}


- (NSArray *)returnArrWithTypekey:(NSString *)key value:(NSString *)value{
    NSMutableArray *a = [NSMutableArray new];
    for (NSDictionary *dict in self) {
        if ([dict[key] isEqualToString:value]) {
            [a addObject:dict];
        }
    }
    return a;
}

- (NSArray *)returnArrWithTypeSearchKey:(NSString *)key value:(NSString *)value{
    NSMutableArray *a = [NSMutableArray new];
    
    NSString *str = [value lowercaseString];//小写
    
    NSArray *arr = [str strZhuanArr];
    
    //    NSString*string =@"sdfsfsfsAdfsdf";
    //    NSArray *arr = [string componentsSeparatedByString:@""];
    //
    //    NSRange range = [string rangeOfString:@"f"];//匹配得到的下标
    //    NSLog(@"rang:%@",NSStringFromRange(range));
    //    string = [string substringWithRange:range];//截取范围类的字符串
    //    NSLog(@"截取的值为：%@",string);
    
    
    for (NSDictionary *dict in self) {
        NSArray *arr2 = [dict[key] strZhuanArr];
        //第一版
        int j = 0;
        for (int i = 0; i < arr2.count; i++) {
            
            if ([arr2[i] isEqualToString:arr[j]]) {
                
                if (j==(arr.count-1)) {
                    [a addObject:dict];
                    break;
                    
                }
                
                j++;
            }
        }
        
        //        if ([dict[key] containsString:str]) {
        //            [a addObject:dict];
        //
        //        }
        
        //        for (NSString *str in [dict allValues]) {
        //            if ([str containsString:value]) {
        //                [a addObject:dict];
        //
        //            }
        //        }
        //
        //        if ([[dict allValues] containsObject:value]) {
        //            [a addObject:dict];
        //        }
    }
    return a;
    
}

@end
