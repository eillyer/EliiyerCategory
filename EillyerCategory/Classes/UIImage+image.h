//
//  UIImage+image.h
//  FriendWay_v_1.0.1
//
//  Created by julong on 16/9/19.
//  Copyright © 2016年 eillyer. All rights reserved.
//



#import <UIKit/UIKit.h>

@interface UIImage (image)

//图片不被渲染类方法
+ (instancetype)imageWithNameOfOriger:(NSString *)name;
+ (instancetype)getMOVImageWithUrl:(NSURL *)url;

+ (UIImage *)getThumbnailImage:(NSString *)videoURL;//根据地址获得图片


/**
 通过视频的URL，time获得视频当前帧图片

 @param url 视频地址
 @param time 时间
 @return image
 */
+ (UIImage *)imageWithMediaURL:(NSURL *)url time:(float)time;

+ (instancetype)scanCodeImageWithStr:(NSString *)str size:(CGFloat)size;//生成二维码
//+ (instancetype)scanCodeImageWithDict:(NSDictionary *)dict size:(CGFloat)size;//生成二维码
//- (UIImage *)scanCodeImageWithData:(NSData *)data;//生成二维码



+ (NSArray *)GIFImage;//mj刷新动画


/**
 设置纯色背景的图片

 @param color 颜色
 @return 返回纯色的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 压缩图片
 
 @param sourceImage 要压缩的图片
 @param targetWidth 压缩宽度
 @return 压缩后的图片
 */
+ (UIImage *)imageWithcompressImage:(UIImage*)sourceImage toTargetWidth:(CGFloat)targetWidth;
    
    
/**
 将一个view转成image

 @param view view
 @return 生成的image
 */
+ (UIImage *)imageWithView:(UIView *)view;
    
    
/**
 将两张图片转成一张

 @param image1 image1 description
 @param image2 image2 description
 @return return value description
 */
+ (UIImage *)addImage:(UIImage *)image1 toImage:(UIImage *)image2;
@end
