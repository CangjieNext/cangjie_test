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
    return 0
}

func foo1(x: Int64): Int64 {
    return Int64(1)
}

func foo1(x: Int64): Int32 {
    return Int32(2)
}

func foo2(x: Int64): Int32 {
    return 1
}

func foo2(x: Int64): Int32 {
    return 2
}

func foo3(x: Int64): Int32 {
    return 1
}

func foo3(x!: Int64): Int32 {
    return 2
}

func foo4(x!: Int64 = 2): Int32 {
    return 1
}

func foo4(y!: Int64 = 1): Int32 {
    return 2
}

func foo5(x: Int64): Int32 {
    return 1
}

func foo5(x!: Int64 = 1): Int32 {
    return 2
}
// ASSERT: scan sema_overload_conflicts
