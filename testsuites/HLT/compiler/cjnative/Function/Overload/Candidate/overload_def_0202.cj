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
    if (foo1(1) != 1) {
        return 1
    }
    if (foo1(Int32(1)) != 2) {
        return 2
    }
    if (foo2(1) != 1) {
        return 3
    }
    if (foo2(Int32(1)) != 1) {
        return 4
    }
    if (foo2(x: 1) != 2) {
        return 5
    }
    if (foo2() != 2) {
        return 5
    }
    if (foo3(x: 1) != 1) {
        return 6
    }
    if (foo3(x: Int32(1)) != 2) {
        return 7
    }
    if (foo4(Int32(1), Int64(1)) != 1) {
        return 8
    }
    if (foo4(1, 1) != 3) {
        return 9
    }
    if (foo5(1, 1) != 2) {
        return 10
    }
    return 0
}

func foo1(x: Int64): Int64 {
    return Int64(1)
}

func foo1(x: Int32): Int32 {
    return Int32(2)
}

func foo2(x: Int32): Int32 {
    return 1
}

func foo2(x!: Int64 = 1): Int32 {
    return 2
}

func foo3(x!: Int64 = 1): Int32 {
    return 1
}

func foo3(x!: Int32 = 1): Int32 {
    return 2
}

func foo4(x: Int32, y: Int64): Int32 {
    return 1
}

func foo4(x: Int64, y: Int32): Int64 {
    return 2
}

func foo4(x: Int64, y: Int64): Int64 {
    return 3
}

func foo5(x: Int32, y: Int64): Int32 {
    return 1
}

func foo5(x: Int64, y: Int64): Int64 {
    return 2
}
