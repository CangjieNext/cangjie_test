/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not MAC) EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// 自定义注解可以被使用的地方可以使用 target 进行限制，如果违反限制则编译报错。

import std.reflect.*

@Annotation[target: [MemberFunction]]
public class A0 {
    public const init() {}
}

@A0
class Foo {}

main() {}
// (not MAC) ASSERT: scan chir_annotation_not_applicable
