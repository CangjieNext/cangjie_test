/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 617906664

func test(a: Int32, b: Int32, c: Int32): Int32 {
    let r: Int32 = a + b
    return (r + c)
}

func test(a: Int64, b: Int64, c: Int64): Int64 {
    let r: Int64 = a + b
    return (r + c)
}

main(): Int64 {
    print(test(Int32(123), Int32(238), Int32(256)).toString())
    print(test(Int64(9999), Int64(888888), Int64(7777)).toString())
    return 0
}
