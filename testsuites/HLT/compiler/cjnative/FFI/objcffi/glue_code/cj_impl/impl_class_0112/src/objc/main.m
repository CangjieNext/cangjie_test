/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "A.h"
#import <Foundation/Foundation.h>

@interface M1 : A
@end
@implementation M1
@end
@interface M2 : A
+ (void)f;
+ (void)g;
@end
@implementation M2
+ (void)f { printf("in oc\n"); }
+ (void)g { [A f]; };
@end
int main(int argc, char** argv) {
    @autoreleasepool {
        [A f];
        [M1 f];
        [M2 f];
        [M2 g];
    }
    return 0;
}
