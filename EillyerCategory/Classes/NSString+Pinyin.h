//
//  NSString+Pinyin.h
//  DownloadDemo
//
//  Created by Kai on 8/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

// Backward compatibility.
extern char pinyinFirstLetter(unsigned short hanzi);

@interface NSString (Pinyin) 

- (NSString *)firstPinyinLetter;
- (NSString *)firstPinyinLettersOfEachWord;

@end
