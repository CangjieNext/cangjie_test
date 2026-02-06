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
- (BOOL)fBool:(BOOL)p1;
- (int8_t)f8:(int8_t)p1;
- (int16_t)f16:(int16_t)p1;
- (int32_t)f32:(int32_t)p1;
- (int64_t)f64:(int64_t)p1;
- (ssize_t)fN:(ssize_t)p1;
- (uint8_t)fU8:(uint8_t)p1;
- (uint16_t)fU16:(uint16_t)p1;
- (uint32_t)fU32:(uint32_t)p1;
- (uint64_t)fU64:(uint64_t)p1;
- (size_t)fUN:(size_t)p1;
- (float)ff32:(float)p1;
- (double)ff64:(double)p1;
@end
@implementation M2
- (BOOL)fBool:(BOOL)p1 { return !p1; }
- (int8_t)f8:(int8_t)p1 { return p1 + 1; }
- (int16_t)f16:(int16_t)p1 { return p1 + 1; }
- (int32_t)f32:(int32_t)p1 { return p1 + 1; }
- (int64_t)f64:(int64_t)p1 { return p1 + 1; }
- (ssize_t)fN:(ssize_t)p1 { return p1 + 1; }
- (uint8_t)fU8:(uint8_t)p1 { return p1 + 1; }
- (uint16_t)fU16:(uint16_t)p1 { return p1 + 1; }
- (uint32_t)fU32:(uint32_t)p1 { return p1 + 1; }
- (uint64_t)fU64:(uint64_t)p1 { return p1 + 1; }
- (size_t)fUN:(size_t)p1 { return p1 + 1; }
- (float)ff32:(float)p1 { return p1 + 1; }
- (double)ff64:(double)p1 { return p1 + 1; }
@end
int main(int argc, char** argv) {
    @autoreleasepool {
        A* a1 = [[A alloc] init];
        A* a2 = [[M1 alloc] init];
        M1* a3 = [[M1 alloc] init];
        A* a4 = [[M2 alloc] init];
        M2* a5 = [[M2 alloc] init];
        printf("in oc, %lld\n", [a1 f64: 1]);
        printf("in oc, %lld\n", [a2 f64: 1]);
        printf("in oc, %lld\n", [a3 f64: 1]);
        printf("in oc, %lld\n", [a4 f64: 1]);
        printf("in oc, %lld\n", [a5 f64: 1]);

        [a1 testOverridden];
        [a5 testOverridden];
    }
    return 0;
}
