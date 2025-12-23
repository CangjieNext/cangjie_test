/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 #import <Foundation/Foundation.h>

@protocol P <NSObject>
- (void)pFoo;
// 实例方法入参类型和返回类型为block类型
- (void)P_instanceMethod:(void (^)(void))completion;
+ (void)P_staticMethod:(void (^)(void))callBack;
@end
