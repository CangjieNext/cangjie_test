/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import <Foundation/Foundation.h>

@interface test : NSObject
- (void)f1;
+ (void)f2;
@end

@implementation test
- (void)f1 {
    printf("f1");
}
+ (void)f2 {
    printf("f2");
}
@end
