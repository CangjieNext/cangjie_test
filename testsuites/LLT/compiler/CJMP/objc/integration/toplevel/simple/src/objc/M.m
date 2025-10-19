/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "M.h"

NSString* foo(NSString* arg, double arg2) {
    NSLog(arg);
    NSLog(@"%lf", arg2);
    return arg;
}

NSString* className(NSObject* arg) {
    return NSStringFromClass([arg class]);
}

int64_t bar(int64_t arg) {
    NSLog(@"%ld", arg + 1);
    return arg + 1;
}

int64_t bar2(int64_t arg) {
    return arg + 1;
}

@implementation M

- (id)init {
    if (self = [super init]) {
    }
    return self;
}

@end
