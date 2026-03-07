// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "M.h"

@implementation N
- (id)init {
    if (self = [super init]) {
        self->_id = 1;
    }
    return self;
}
- (double)mapF: (double(^)(double)) f {
    return f(1.0);
}
- (N*)letF: (N*(^)(N*)) f {
    void *blockPointer = (__bridge_retained void *)f;
    printf("\n\nBlock pointer: %p\n\n", blockPointer);
    f(self);
    return f(self);
}
- (int64_t)id {
    return self->_id;
}
@end

N* incId(N* x) {
    N* n = [[N alloc] init];
    n->_id = x->_id + 1;
    return n;
}

double timesTwo(double x) {
    return x * 2;
}

@implementation M
- (id)init {
    if (self = [super init]) {
    }
    return self;
}
- (double(^)(double))fPtr {
    double mult = 2.0;
    return ^(double x){ return x * mult; };
}
- (K*)makeK {
    return [[K alloc] init];
}
- (N*(^)(N*))makeNFunc {
    int increment = 1;
    return ^(N* x){
        N* n = [[N alloc] init];
        n->_id = x->_id + increment;
        return n;
    };
}
@end
