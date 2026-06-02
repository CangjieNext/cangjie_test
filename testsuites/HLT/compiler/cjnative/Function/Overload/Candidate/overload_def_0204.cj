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
    if (foo(1, 1) != 2) {
        return 1
    }
    if (foo(1, 1, z: 1) != 3) {
        return 1
    }
    if (foo1(1, z: 1) != 3) {
        return 1
    }
    if (foo2(x: 1) != 2) {
        return 1
    }
    return 0
}

func foo(x: Int32) {
    func foo(x: Int32) {
        return x + 3
    }
    return foo(x) + 1
}

func foo(x: Int32, y: Int32) {
    return x + y
}

func foo(x: Int32, y: Int32, z!: Int32) {
    return x + y + z
}

func foo1(x: Int32, y!: Int32 = 1) {
    return x + y
}

func foo1(x: Int32, y!: Int32 = 1, z!: Int32 = 1) {
    return x + y + z
}

func foo2(x!: Int64 = 2, y!: Int32): Int32 {
    return 1
}

func foo2(x!: Int32): Int32 {
    return 2
}
