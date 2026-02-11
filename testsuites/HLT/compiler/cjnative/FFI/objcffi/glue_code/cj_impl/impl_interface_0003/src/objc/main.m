/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "Clz.h"
#import "I.h"
#import <Foundation/Foundation.h>

@interface M : NSObject <I>
@end

@implementation M
- (void)f: (BOOL)a {
    printf("in oc f, %s\n", a ? "true" : "false");
}
- (BOOL)fBool: (BOOL)a {
    printf("in oc fBool, %s\n", a ? "true" : "false");
    return a;
}
- (int8_t)fI8:(int8_t)a {
    printf("in oc fI8, %d\n", a);
    return a;
}
- (int16_t)fI16:(int16_t)a {
    printf("in oc fI16, %hd\n", a);
    return a;
}
- (int32_t)fI32:(int32_t)a {
    printf("in oc fI32, %d\n", a);
    return a;
}
- (int64_t)fI64:(int64_t)a {
    printf("in oc fI64, %lld\n", a);
    return a;
}
- (ssize_t)fIN:(ssize_t)a {
    printf("in oc fIN, %zd\n", a);
    return a;
}
- (uint8_t)fUI8:(uint8_t)a {
    printf("in oc fUI8, %u\n", a);
    return a;
}
- (uint16_t)fUI16:(uint16_t)a {
    printf("in oc fUI16, %hu\n", a);
    return a;
}
- (uint32_t)fUI32:(uint32_t)a {
    printf("in oc fUI32, %u\n", a);
    return a;
}
- (uint64_t)fUI64:(uint64_t)a {
    printf("in oc fUI64, %llu\n", a);
    return a;
}
- (size_t)fUIN:(size_t)a {
    printf("in oc fUIN, %zu\n", a);
    return a;
}
- (float)fF32:(float)a {
    printf("in oc fF32, %f\n", a);
    return a;
}
- (double)fF64:(double)a {
    printf("in oc fF64, %f\n", a);
    return a;
}

@end

int main(int argc, char** argv) {
    @autoreleasepool {
        id<I> a = [[M alloc] init];
        [a f: true];
        [Clz testI: a];
    }
}
