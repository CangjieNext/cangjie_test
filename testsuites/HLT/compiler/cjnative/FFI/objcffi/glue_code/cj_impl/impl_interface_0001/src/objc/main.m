/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "I.h"
#import <Foundation/Foundation.h>

@interface M : NSObject <I>
@end

@implementation M
- (void)f {
    printf("in oc f\n");
}
@end

int main(int argc, char** argv) {
    @autoreleasepool {
        id<I> a = [[M alloc] init];
        [a f];
    }
    return 0;
}
