// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import <stdint.h>

@protocol I
@property(readwrite) int64_t p1;
@property(readonly) int64_t p2;
- (void)f1;
- (void)f2;
@end
