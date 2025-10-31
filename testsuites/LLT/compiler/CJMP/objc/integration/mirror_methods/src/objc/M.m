// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import <objc/runtime.h>
#import "M.h"

@implementation M
- (id) init {
    if (self = [super init]) {
        printf("objc: M init()\n");
    }

    return self;
}

- (K*) noParams {
    printf("objc: noParams\n");
    K* k = [[K alloc] init];
    [k setNumber:42];
    return k;
}

- (F*) oneParam:(int)first {
    printf("objc: oneParam %d\n", first);
    F* f = [[F alloc] init];
    [f setNumber:42];
    return f;
}

- (double) twoParams:(long)first second:(double)second {
    printf("objc: twoParams %ld %lf\n", first, second);
    return 3.1415;
}

- (long) fiveParams:(long)first second:(long)second third:(long)third fourth:(long)fourth fifth:(long)fifth {
    printf("objc: fiveParams %ld %ld %ld %ld %ld\n", first, second, third, fourth, fifth);
    return 10;
}

+ (long) staticFunc:(long)first {
    printf("objc: staticFunc %ld\n", first);
    return 20;
}

- (long) openFunc:(long)first {
    printf("objc: openFunc %ld\n", first);
    return 30;
}

@end
