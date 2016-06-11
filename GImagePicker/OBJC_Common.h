//
//  OBJC_Common.h
//  tk_iOS
//
//  Created by nishiyama on 2014/12/18.
//  Copyright (c) 2014年 kansatsu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OBJC_Common : NSObject


+(NSString*)getDataHomeDicrectory;
+(NSString *)makeUniqueString;
+(NSString *)stringWithDeviceToken:(NSData *)deviceToken;
+(BOOL)isAllHalfWidthCharacter:(NSString*)value;
+(NSString *)changeUnit:(NSString*)value per:(int)per;

@end
