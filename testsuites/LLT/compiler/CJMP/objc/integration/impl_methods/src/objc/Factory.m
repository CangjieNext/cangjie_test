// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "Factory.h"

@implementation Factory
- (id)init {
    if (self = [super init]) {
        return self;
    }
    return 0;
}
- (Derived*)derived {
    return [[Derived alloc] init];
}
- (Base*)base {
    return [[Base alloc] init];
}
- (Base*)derivedAsBase {
    return [[Derived alloc] init];
}
- (ImplBox*)boxWith: (int64_t)value {
    ImplBox* obj = [[ImplBox alloc] init];
    obj.value = value;
    return obj;
}
@end
