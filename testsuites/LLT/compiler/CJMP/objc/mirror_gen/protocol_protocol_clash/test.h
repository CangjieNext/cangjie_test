/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

@class A;
@class AProtocol;

@protocol A
-(void)aaa;
@end

@protocol AProtocol
-(void)ppp;
@end

@interface M {
  A* a;
  AProtocol* p;
  id<A> pa;
  id<AProtocol> pp;
}
@end
