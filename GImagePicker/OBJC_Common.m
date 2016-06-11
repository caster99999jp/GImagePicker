//
//  OBJC_Common.m
//  tk_iOS
//
//  Created by nishiyama on 2014/12/18.
//  Copyright (c) 2014年 kansatsu. All rights reserved.
//

#import "OBJC_Common.h"

@implementation OBJC_Common


+(NSString*)getDataHomeDicrectory
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* path = (NSString*)[paths objectAtIndex:0];
    path = [path stringByAppendingPathComponent:@"data"];
    return path;
}



+(NSString *)makeUniqueString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyMMddHHmmss"];
    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
    
    int randomValue = arc4random() % 1000;
    
    NSString *unique = [NSString stringWithFormat:@"%@.%d",dateString,randomValue];
    return unique;
}


+(NSString *)stringWithDeviceToken:(NSData *)deviceToken
{
    const char *data = [deviceToken bytes];
    NSMutableString *token = [NSMutableString string];
    for (int i = 0; i < [deviceToken length]; i++)
        [token appendFormat:@"%02.2hhX", data[i]];
    return [token copy];
}

+(BOOL)isAllHalfWidthCharacter:(NSString*)value
{
    NSUInteger nsStringlen = [value length];
    const char *utf8 = [value UTF8String];
    size_t cStringlen = strlen(utf8);
    if (nsStringlen == cStringlen) {
        return YES;
    } else {
        return NO;
    }
}


+(NSString *)changeUnit:(NSString*)value per:(int)per
{
    double total = value.doubleValue;
    NSString* unit = @"";
    
    if (total >= (1024 * 1024 * 1024)) {
        total = total / (1024 * 1024 * 1024);
        unit = @"GByte";
    } else if (total >= (1024 * 1024)) {
        total = total / (1024 * 1024);
        unit = @"MByte";
    } else if (total >= 1024) {
        total = total / 1024;
        unit = @"KByte";
    } else if (total < 1024) {
        unit = @"Byte";
    }
    
    if (per == 0) {
        int inttotal = total;
        return [NSString stringWithFormat:@"%d %@", inttotal, unit];
    } else {
        NSString* format = [[@"%." stringByAppendingString:[NSString stringWithFormat:@"%d", per]] stringByAppendingString:@"f %@"];
        return [NSString stringWithFormat:format, total, unit];
    }
}



@end
