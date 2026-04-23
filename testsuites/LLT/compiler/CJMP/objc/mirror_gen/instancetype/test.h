/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

@interface Base
+(nullable instancetype)static_basic_foo0;
-(nullable instancetype)instance_basic_foo0;
+(nonnull instancetype)static_basic_foo;
-(nonnull instancetype)instance_basic_foo;
@end

@interface M : Base
+(nullable instancetype)static_basic_foo0;
-(nullable instancetype)instance_basic_foo0;
+(nullable instancetype)static_foo0;
-(nullable instancetype)instance_foo0;
+(nonnull instancetype)static_basic_foo;
-(nonnull instancetype)instance_basic_foo;
+(nonnull instancetype)static_foo;
-(nonnull instancetype)instance_foo;
@end
