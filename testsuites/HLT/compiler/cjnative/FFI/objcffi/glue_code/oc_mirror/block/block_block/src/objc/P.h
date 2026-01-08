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
- (void (^)(void))P_instanceMethod:(void (^)(void))callBack;
+ (void (^)(void))P_staticMethod:(void (^)(void))callBack;
// protocol中required实例方法和静态方法
@required
- (void (^)(void))P_required_instanceMethod:(void (^)(void))callBack;
+ (void (^)(void))P_required_staticMethod:(void (^)(void))callBack;
// protocol中optional实例方法和静态方法
@optional
// 普通的optional实例方法，用于验证基本功能无问题
- (void)P_normal_optional_func;
+ (void)P_normal_optional_static_method;
- (void (^)(void))P_optional_instanceMethod:(void (^)(void))callBack;
+ (void (^)(void))P_optional_staticMethod:(void (^)(void))callBack;
@end
