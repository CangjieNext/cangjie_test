/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import <Foundation/Foundation.h>
#import "M1.h"

@interface M2 : NSObject
{
    @public
    id<I> v;
}
- (id)init;
- (id<I>)g1;
- (id<I>)g2;
- (void)g3:(id<I>)a;
@property (assign) id<I> p;

@end
