/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

struct S1 {}

struct S2 {}

func foo1(x: S1): Unit {}

func foo2(x: S2): Unit {}

main(): Int64 {
    var a: (Any) -> Unit = if (true) {
        foo1
    } else {
        foo2
    }
    return 0
}
// ASSERT: scan sema_no_match_function_declaration_for_ref
