/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %f pkgs.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkgs

struct test {
    public func foo(a: Int32): Int32 {
        return 2 * a
    }
}

func run(): Int64 {
    var res1: Int32 = pkgs.test().foo(2)
    var res2: Int32 = test().foo(3)
    if (res1 + res2 == 8) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return run()
}
