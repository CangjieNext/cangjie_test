// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// Regression test for issue #1182: a parenthesized base of a subscript expression is a
// valid left-hand side of an assignment, e.g. `(a)[0] = 5`.
main(): Int64 {
    var a = [1, 2, 3]
    (a)[0] = 5
    if (a[0] != 5) {
        return 1
    }
    var i = 1
    (a)[i] = 6
    if (a[1] != 6) {
        return 2
    }
    ((a))[2] = 7
    if (a[2] != 7) {
        return 3
    }
    return 0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
