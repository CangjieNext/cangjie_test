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
- (BOOL)getBool:(BOOL)p1;
- (int8_t)getI8:(int8_t)p1;
- (int16_t)getI16:(int16_t)p1;
- (int32_t)getI32:(int32_t)p1;
- (int64_t)getI64:(int64_t)p1;
- (ssize_t)getIN:(ssize_t)p1;
- (uint8_t)getU8:(uint8_t)p1;
- (uint16_t)getU16:(uint16_t)p1;
- (uint32_t)getU32:(uint32_t)p1;
- (uint64_t)getU64:(uint64_t)p1;
- (size_t)getUN:(size_t)p1;
- (float)getf32:(float)p1;
- (double)getf64:(double)p1;
@end
@implementation M2
- (BOOL)getBool:(BOOL)p1 { return !p1; }
- (int8_t)getI8:(int8_t)p1 { return p1 + 1; }
- (int16_t)getI16:(int16_t)p1 { return p1 + 1; }
- (int32_t)getI32:(int32_t)p1 { return p1 + 1; }
- (int64_t)getI64:(int64_t)p1 { return p1 + 1; }
- (ssize_t)getIN:(ssize_t)p1 { return p1 + 1; }
- (uint8_t)getU8:(uint8_t)p1 { return p1 + 1; }
- (uint16_t)getU16:(uint16_t)p1 { return p1 + 1; }
- (uint32_t)getU32:(uint32_t)p1 { return p1 + 1; }
- (uint64_t)getU64:(uint64_t)p1 { return p1 + 1; }
- (size_t)getUN:(size_t)p1 { return p1 + 1; }
- (float)getf32:(float)p1 { return p1 + 1; }
- (double)getf64:(double)p1 { return p1 + 1; }
@end
int main(int argc, char** argv) {
    @autoreleasepool {
        A* a1 = [[A alloc] init];
        A* a2 = [[M1 alloc] init];
        M1* a3 = [[M1 alloc] init];
        A* a4 = [[M2 alloc] init];
        M2* a5 = [[M2 alloc] init];
        printf("in oc, %lld\n", [a1 getI64: 1]);
        printf("in oc, %lld\n", [a2 getI64: 1]);
        printf("in oc, %lld\n", [a3 getI64: 1]);
        printf("in oc, %lld\n", [a4 getI64: 1]);
        printf("in oc, %lld\n", [a5 getI64: 1]);

        [a1 testOverridden];
        [a5 testOverridden];
    }
    return 0;
}
