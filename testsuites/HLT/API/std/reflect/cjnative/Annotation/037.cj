/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (!(target_mac | target_ios | target_ios_simulator)) EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// @后的标识符既无法被确定为宏也无法确定为注解，则编译报错。

@UnknownAnnotation[1.5]
class Foo {}

main() {}
// (!(target_mac | target_ios | target_ios_simulator)) ASSERT: scan sema_undeclared_identifier
