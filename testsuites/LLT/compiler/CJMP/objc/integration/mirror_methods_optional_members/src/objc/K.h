// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import <Foundation/Foundation.h>

@protocol K
@optional
- (void) unimplemented;
- (void) implemented;
- (void) unimplementedWithArg: (int64_t) i;
- (void) implementedWithArg: (int64_t) i;
@end