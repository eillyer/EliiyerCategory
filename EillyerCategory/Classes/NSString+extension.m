//
//  NSString+extension.m
//  HuaShangXiangYi
//
//  Created by 徐实 on 15/4/7.
//  Copyright (c) 2015年 xiaozhu. All rights reserved.
//

#import "NSString+extension.h"
#import "NSString+Pinyin.h"




@implementation NSString (extension)



//判断字符串是否为浮点数
- (BOOL)isPureFloat{
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

- (bool)isNumber
{
    NSString *numberRegex = @"[0-9]+";
    NSPredicate *regexNumber = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    return [regexNumber evaluateWithObject:self];
}

- (bool)isUrl
{
    NSString *urlStr = [self lowercaseString];
    NSString *urlRegEx = @"^((https|http|ftp|rtsp|mms)?://)?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?(([0-9]{1,3}\\.){3}[0-9]{1,3}|([0-9a-z_!~*'()-]+\\.)*([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\\.[a-z]{2,6})(:[0-9]{1,4})?((/?)|(/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+/?)$";
    
    NSPredicate *urlPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",urlRegEx];
    
    
    return [urlPre evaluateWithObject:urlStr];
}

- (bool)isPhone
{
    /**
     10         * 中国移动：China Mobile
     11         * 134,135,136,137,138,139,150,151,152,157,158,159,147,182,183,184,187,188,1705
     12         */
    //NSString * CM = @"^1((3[4-9]|5[0127-9]|8[23478]|47)[0-9]|705)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,145,155,156,185,186,176,1709
     17         */
    //NSString * CU = @"^1((3[0-2]|5[56]|8[56]|76)[0-9]|709)\\d{7}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,153,180,181,189,1700
     22         */
    //NSString * CT = @"^1((33|53|8[019])[0-9]|700)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
     NSString * PHS =  @"^(1(([3456789][0-9])|(47)|[8][0126789]))\\d{8}$";
    
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    //NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    //NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    //NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestcm evaluateWithObject:self] == YES))
    {
        return YES;
    }else return NO;
    
//    if (([regextestcm evaluateWithObject:self] == YES)
//        || ([regextestct evaluateWithObject:self] == YES)
//        || ([regextestcu evaluateWithObject:self] == YES))
//    {
//        return YES;
//    }
//    else
//    {
//        return NO;
//    }
}



- (BOOL)isEnwordOrNumWord
{
    NSString * regex = @"^[A-Za-z0-9]{6,16}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}


-  (int)convertToLength {
    
    int strlength = 0;
    char* p = (char*)[self cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[self lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    return (strlength+1)/2;
    
}


- (bool)isEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (bool)isZipcode
{
    NSString *zipCodeRegex = @"[1-9]d{5}(?!d)";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", zipCodeRegex];
    return [emailTest evaluateWithObject:self];
}

- (bool)isIdentity
{
    NSString *identityRegex = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",identityRegex];
    return [identityCardPredicate evaluateWithObject:self];
}

- (bool)isSingle
{
    NSString *singleRegex = @"^([\u4e00-\u9fa5]+|([a-zA-Z]+\\s?)+)$";
    NSPredicate *singleCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",singleRegex];
    return [singleCardPredicate evaluateWithObject:self];
}

- (bool)isChinese
{
    NSString *match=@"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}

- (bool)isNullString
{
    if ( [self isKindOfClass:[NSNull class]] || !self || self == nil || [self isEqualToString:@"(null)"] || [self isEqualToString:@"<null>"] || [self isEqualToString:@""] || [self length] == 0)
    {
       return YES;
    }
    else
    {
        return NO;
    }
}



- (bool)isSpace
{
    BOOL isSpace = YES;
    for ( int i = 0; i<self.length; i++) {
        char c = [self characterAtIndex:i];
        if (c  != ' ') {
            isSpace = NO;
            break;
        }
    }
    return isSpace;
}


-(NSString *)URLEncoding
{
    NSString *result = ( NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)self,
                                                              NULL,
                                                              CFSTR("!*();+$,%#[] "),
                                                              kCFStringEncodingUTF8));
    return result;
}











- (NSString *)urlEncode
{
    NSString* encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                                                                    NULL,
                                                                                                    (CFStringRef) self,
                                                                                                    NULL,
                                                                                                    (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                                    kCFStringEncodingUTF8 ));
    return encodedString ;
}







//处理电话号码
-(NSMutableString *)handleMobile
{
    
    NSMutableString *str = [NSMutableString stringWithString:self];
    
    
    if (str.length > 4) {
        
        int begin = (str.length-4)/2;//中间四位
        NSRange range = NSMakeRange(begin, 4);
        
        //NSRange range = NSMakeRange(str.length-4, 4);//后四位
        [str replaceCharactersInRange:range withString:@"****"];
    }
    
    
    return str;
}






- (CGSize)sizeWithTextFont:(UIFont *)font maxW:(CGFloat)maxW{
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    
}
/*
 *判断是否全为空格,或为空串
 */
- (BOOL) isEmpty {
    
    if (!self) {
        return true;
    } else {
        //A character set containing only the whitespace characters space (U+0020) and tab (U+0009) and the newline and nextline characters (U+000A–U+000D, U+0085).
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        
        //Returns a new string made by removing from both ends of the receiver characters contained in a given character set.
        NSString *trimedString = [self stringByTrimmingCharactersInSet:set];
        
        if ([trimedString length] == 0) {
            return true;
        } else {
            return false;
        }
    }
}

@end
