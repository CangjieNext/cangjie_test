/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (foo(1) != 2) {
        return 1
    }
    var m = foo
    if (m(1) != 2) {
        return 1
    }
    if (goo(1) != 2) {
        return 1
    }
    var n = goo
    if (n(1) != 2) {
        return 1
    }
    return 0
}

func foo(x: Int32) {
    var y: Int32 = x + 1
    return y
}

func goo(x: Int32) {
    return x + 1
}
