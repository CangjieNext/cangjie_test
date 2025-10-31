// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import <Foundation/Foundation.h>
#import <stddef.h>
#import "Box.h"
#import "ImplBox.h"

@interface Base : NSObject
- (id)init;
- (BOOL)arg0;
- (int64_t)primitive1WithArg0:(int64_t)i;
- (int64_t)primitive2WithArg0:(int64_t)i withArg1: (float)f;
- (int64_t)primitive3WithArg0:(int64_t)i withArg1: (float)f withArg2: (BOOL)b;
- (int64_t)mirror1WithArg0:(Box*)arg0;
- (int64_t)mirror2WithArg0:(Box*)arg0 withArg1: (Box*)arg1;
- (int64_t)mirror3WithArg0:(Box*)arg0 withArg1: (Box*)arg1 withArg2: (Box*)arg2;
- (int64_t)impl1WithArg0:(ImplBox*)arg0;
- (int64_t)impl2WithArg0:(ImplBox*)arg0 withArg1: (ImplBox*)arg1;
- (int64_t)impl3WithArg0:(ImplBox*)arg0 withArg1: (ImplBox*)arg1 withArg2: (ImplBox*)arg2;
- (Box*)returnMirror:(Box*)box;
- (ImplBox*)returnImpl:(ImplBox*)box;
@end
