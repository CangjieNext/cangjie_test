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
- (id)init;
@end
@implementation M1
- (id)init { return [super init]; }
@end
@interface M2 : A
- (void)f;
- (void)g;
@end
@implementation M2
- (void)f { printf("in oc\n"); }
- (void)g { [super f]; };
@end
int main(int argc, char** argv) {
    @autoreleasepool {
        A* a1 = [[A alloc] init];
        A* a2 = [[M1 alloc] init];
        M1* a3 = [[M1 alloc] init];
        A* a4 = [[M2 alloc] init];
        M2* a5 = [[M2 alloc] init];
        [a1 f];
        [a2 f];
        [a3 f];
        [a4 f];
        [a5 f];
        [a4 g];
        [a5 g];
    }
    return 0;
}
