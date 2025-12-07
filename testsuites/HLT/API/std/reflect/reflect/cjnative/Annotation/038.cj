/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not MAC) EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// 同一源码文件中存在同名的注解和宏的声明将导致编译报错。
macro package myMacro

import std.ast.*

@Annotation
class A0 {
    public const init() {}
}

public macro A0(input: Tokens): Tokens {
    input
}

main() {}
// (not MAC) ASSERT: scan sema_annotation_non_public
// (not MAC) ASSERT: scan sema_redefinition
