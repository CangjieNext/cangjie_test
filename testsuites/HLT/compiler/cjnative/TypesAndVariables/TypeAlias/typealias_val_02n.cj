/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

type int = Int32

type str = String

func foo(x: int, y: str): str {
    return x.toString() + y
}

func foo(x: Int32, y: String): String {
    return x.toString() + y.toString()
}

main(): Int64 {
    var i: int = 3
    let s: str = "hi"
    var res: str = foo(i, s)
    if (res == "3hi") {
        return 0
    }
    return 1
}
// ASSERT: scan sema_overload_conflicts
// ASSERT: scan sema_ambiguous_match
