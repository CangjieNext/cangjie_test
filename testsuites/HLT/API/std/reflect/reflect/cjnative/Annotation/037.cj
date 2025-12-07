/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not MAC) EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// @后的标识符既无法被确定为宏也无法确定为注解，则编译报错。

@UnknownAnnotation[1.5]
class Foo {}

main() {}
// (not MAC) ASSERT: scan sema_undeclared_identifier
