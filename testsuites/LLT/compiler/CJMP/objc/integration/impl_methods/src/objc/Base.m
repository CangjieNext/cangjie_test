// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "Base.h"

@implementation Base
- (id)init {
    if (self = [super init]) {
        return self;
    }
    return 0;
}
- (BOOL)arg0 { return YES; }
- (int64_t)primitive1WithArg0:(int64_t)i {
    return i + 3;
}
- (int64_t)primitive2WithArg0:(int64_t)i withArg1: (float)f {
    return ((int64_t)f) + i + 5;
}
- (int64_t)primitive3WithArg0:(int64_t)i withArg1: (float)f withArg2: (BOOL)b {
    return ((int64_t)f) + i + b;
}
- (int64_t)mirror1WithArg0:(Box*)arg0 {
    return arg0.value;
}
- (int64_t)mirror2WithArg0:(Box*)arg0 withArg1: (Box*)arg1 {
    return arg0.value + arg1.value;
}
- (int64_t)mirror3WithArg0:(Box*)arg0 withArg1: (Box*)arg1 withArg2: (Box*)arg2 {
    return arg0.value + arg1.value + arg2.value;
}
- (int64_t)impl1WithArg0:(Box*)arg0 {
    return arg0.value;
}
- (int64_t)impl2WithArg0:(Box*)arg0 withArg1: (Box*)arg1 {
    return arg0.value + arg1.value;
}
- (int64_t)impl3WithArg0:(Box*)arg0 withArg1: (Box*)arg1 withArg2: (Box*)arg2 {
    return arg0.value + arg1.value + arg2.value;
}
- (Box*)returnMirror: (Box*) box {
    Box* result = [[Box alloc] init];
    result.value = 777;
    return result;
}
- (ImplBox*)returnImpl: (ImplBox*) box {
    ImplBox* result = [[ImplBox alloc] init];
    result.value = 777;
    return result;
}
@end
