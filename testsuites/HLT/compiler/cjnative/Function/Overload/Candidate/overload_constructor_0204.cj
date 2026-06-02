/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var a = match (foo) {
        case foo(x) => 1
        case foo(x, y) => 2
        case foo => 0
        case _ => 4
    }
    if (a != 0) {
        return 1
    }
    var b = match (foo(1)) {
        case foo(x) => 0
        case foo(x, y) => 2
        case foo => 3
        case _ => 4
    }
    if (b != 0) {
        return 1
    }
    var c = match (foo(1, 1)) {
        case foo(x) => 1
        case foo(x, y) => 0
        case foo => 3
        case _ => 4
    }
    if (c != 0) {
        return 1
    }
    return 0
}

enum TimeUnit {
    foo
    | foo(Int32)
    | foo(Int32, Int32)
}
