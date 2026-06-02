/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_mismatched_types

func foo(a!: Rune = r"x"): Int64 {
    if (a == r"y") {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    var res = foo(a: "y")
    return res
}
