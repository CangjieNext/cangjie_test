/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface I {
    static func foo(x: Int32) {
        return x
    }
    static func coo(x: Int32): Int32 {
        return foo(x)
    }
}

class Test <: I {}

func run(): Int64 {
    if (Test.coo(2) != 2) {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
