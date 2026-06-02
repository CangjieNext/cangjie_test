/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args

interface I {
    static func foo(x: Int32): Int32 {
        return 4
    }
}

func run(): Int64 {
    if (I.foo(2) != 4) {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
