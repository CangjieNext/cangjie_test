// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import <Foundation/Foundation.h>
#import "K.h"
#import "F.h"

@interface M : NSObject
- (id)init;
- (K*)noParams;
- (F*)oneParam:(int)first;
- (double)twoParams:(long)first second:(double)second;
- (long)fiveParams:(long)first second:(long)second third:(long)third fourth:(long)fourth fifth:(long)fifth;
+ (long)staticFunc:(long)first;
- (long)openFunc:(long)first;
@end
