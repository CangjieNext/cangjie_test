/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "M.h"
#import "A.h"

@implementation M

- (id)init { return [super init]; }

+ (NSString*) helloAscii {
    return @"Hello, world!";
}

+ (NSString*) helloCyrillic {
    return @"Привет, мир!";
}

+ (NSString*) helloCangjie {
    return @"你好世界！";
}

+ (NSString*) helloEmoji {
    return @"👋🏻🗺️";
}

+ (NSString*) empty {
    return @"";
}

+ (NSString*) long {
    NSString* baseString = @"Hello, world! ";
    NSString* testString = [@"" stringByPaddingToLength:10000 * [baseString length] withString:baseString startingAtIndex:0];
    return testString;
}

+ (NSString*) uppercase:(NSString*)str {
    return [str uppercaseString];
}

+ (void) checkUpperHelloAscii:(NSString*)str {
    NSAssert([@"HELLO, WORLD!" isEqual:str], @"Not equal!");
}

+ (void) checkExportedImpl {
    NSString* str = @"HELLO, WORLD!";
    NSAssert([[A lowercase:str] isEqual:[str lowercaseString]], @"Not equal!");

    printf("objc: %s\n", [[A getNSString] UTF8String]);
    [A printString:@"Hello, world!"];
}

@end
