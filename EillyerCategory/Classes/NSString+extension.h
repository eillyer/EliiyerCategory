//
//  NSString+extension.h
//  HuaShangXiangYi
//
//  Created by 徐实 on 15/4/7.
//  Copyright (c) 2015年 xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef uint32_t CC_LONG;
#define CC_MD5_DIGEST_LENGTH    16
extern unsigned char *CC_MD5(const void *data, CC_LONG len, unsigned char *md)
__OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

@interface NSString (extension)

/// 判断字符串是否为浮点数
- (BOOL)isPureFloat;



/**
 * 字符串数字校验
 * @returned    bool值
 */
- (bool)isNumber;

/**
 * 字符串手机号校验
 * @returned    bool值
 */
- (bool)isPhone;

/**
 *  英文字母和数字校验
 * @returned    bool值
 */
- (bool)isEnwordOrNumWord;

/**
 *  url
 * @returned    bool值
 */
- (bool)isUrl;

/**
 * 字符串邮箱校验
 * @returned    bool值
 */
- (bool)isEmail;

/**
 * 字符串邮政编码校验
 * @returned    bool值
 */
- (bool)isZipcode;

/**
 * 字符串身份证校验
 * @returned    bool值
 */
- (bool)isIdentity;

/**
 * 字符串名字校验
 * @returned    bool值
 */
- (bool)isSingle;

/**
 * 字符串中文校验
 * @returned    bool值
 */
- (bool)isChinese;

/**
 * 字符串空判断
 * @returned    字符串是否为空
 */
- (bool)isNullString;

/**
 * 字符串空判断
 * @returned    字符串是否为空格
 */
- (BOOL)isSpace;

/**
 * url编码
 * @returned    编码后的url字串
 */
-(NSString *)URLEncoding;




/**
 *
 * @returned 
 */
- (int)convertToLength;



- (NSString*)urlEncode;



//- (BOOL) isEmail;



- (BOOL)validateIdentityCard;


//判断字符串是否为纯数字
-(BOOL)isNumText;



//获取size
- (CGSize)sizeWithTextFont:(UIFont *)font maxW:(CGFloat)maxW;
/**
 *判断是否全为空格
 */
- (BOOL) isEmpty;
@end
