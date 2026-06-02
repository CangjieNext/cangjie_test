/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    foo1(x: 1, y: 1)
    foo1(x: Int32(1), y: Int64(1))
    foo2()
    foo3(x: 1, y: 1)
    foo3(x: Int32(1), y: Int64(1))
    foo3()
    foo4(1, 1)
    return 0
}

func foo1(y!: Int64, x!: Int32): Int32 {
    return 1
}

func foo1(x!: Int32, y!: Int64): Int32 {
    return 2
}

func foo3(y!: Int64 = 1, x!: Int32 = 1): Int32 {
    return 1
}

func foo3(x!: Int32 = 1, y!: Int64 = 1): Int32 {
    return 2
}

func foo2(x!: Int64 = 1): Int32 {
    return 1
}

func foo2(x!: Int32 = 1): Int32 {
    return 2
}

func foo4(x: Int32, y: Int64): Int32 {
    return 1
}

func foo4(x: Int64, y: Int32): Int64 {
    return 2
}
// ASSERT: scan sema_ambiguous_match
