// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import <Foundation/Foundation.h>

typedef void (*callbackType)(int x);

@interface Base : NSObject {}
- (void) callFunction:(callbackType)callback andX:(int)x;
@end
