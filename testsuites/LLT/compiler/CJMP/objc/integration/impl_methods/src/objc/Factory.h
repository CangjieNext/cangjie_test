// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import <Foundation/Foundation.h>
#import <stddef.h>
#import "Base.h"
#import "Derived.h"

@interface Factory : NSObject
- (id)init;
- (Derived*)derived;
- (Base*)base;
- (Base*)derivedAsBase;
- (ImplBox*)boxWith: (int64_t)value;
@end
