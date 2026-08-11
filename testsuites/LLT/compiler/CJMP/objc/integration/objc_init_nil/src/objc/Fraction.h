// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import <Foundation/Foundation.h>

@interface Fraction : NSObject
{
    @public long num;
    @public long denom;
}
-(id) initWithNum: (int) num andDenom: (int) denom;
-(void) doStuff;
@end
