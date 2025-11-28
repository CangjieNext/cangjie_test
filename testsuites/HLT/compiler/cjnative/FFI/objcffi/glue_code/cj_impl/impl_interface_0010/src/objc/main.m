/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "I1.h"
#import "I2.h"
#import <Foundation/Foundation.h>

@interface M1 : NSObject <I1>
@end
@interface M2 : NSObject <I2>
@end

@implementation M1
- (void)f {
    printf("in oc f\n");
}
@end
@implementation M2
- (void)f:(I1)a {
    [a f];
}
@end

int main(int argc, char** argv) {
    @autoreleasepool {
        id<I1> a1 = [[M1 alloc] init];
        id<I2> a2 = [[M2 alloc] init];
        [a2 f: a1];
    }
    return 0;
}
