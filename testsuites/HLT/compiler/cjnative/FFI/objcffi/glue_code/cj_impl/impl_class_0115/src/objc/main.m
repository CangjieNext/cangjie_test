/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "S.h"
#import "Opencls.h"
#import <Foundation/Foundation.h>

@interface M : Opencls
- (id)init;
@end
@implementation M
- (id)init { return [super init: 11]; }
@end
int main(int argc, char** argv) {
    @autoreleasepool {
        Opencls* n = [[M alloc] init];

        S* s = [[S alloc] init]; // disable when open class as parameter gets supported for constructor 
        // S* s = [[S alloc] init: n]; // enable when open class as parameter gets supported for constructor

        // n = [S stFoo: n]; // enable when open class as result/parameter gets supported
        // n = [s foo: n]; // enable when open class as result/parameter gets supported
        // n = [s implicitFoo: n]; // enable when open class as result/parameter gets supported
        printf("in oc n.getV got %lld\n", [n getV]);

        [s.constOC f];
        [s.implicitOC f];
        [s.oc f];
        [s.p f];
        [s.mutP f];

        [S.stConstOC f];
        [S.stOC f];
        [S.stP f];
        [S.stMutP f];
    }
    return 0;
}
