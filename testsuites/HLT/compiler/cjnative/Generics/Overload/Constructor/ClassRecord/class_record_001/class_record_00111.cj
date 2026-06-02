/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A_first
// ASSERT: scan B_first

open class A {}

open class B <: A {}

class X {
    public init(inp: () -> A) {
        print("A_first")
    }
    public init(inp: () -> B) {
        print("A_second")
    }
}

struct Y {
    public init(inp: () -> A) {
        print("B_first")
    }
    public init(inp: () -> B) {
        print("B_second")
    }
}

main(): Int64 {
    var lmb: () -> A = {=> B()}
    var i = X(lmb)
    var j = Y(lmb)
    return 0
}
