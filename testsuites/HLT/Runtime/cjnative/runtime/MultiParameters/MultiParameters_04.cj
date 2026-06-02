/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 110

func foo(a: Int32, b: Int32, c: Int32, d: Int32, e: Int32, f: Int32, g: Int32, h: Int32, i: Int32, j: Int32): Int32 {
    if (a + b + c + d + e + f + g + h + i + j > 100) {
        return a + b + c + d + e + f + g + h + i + j
    } else {
        return foo(a + 1, b + 1, c + 1, d + 1, e + 1, f + 1, g + 1, h + 1, i + 1, j + 1)
    }
}

main(): Int64 {
    var a = foo(-5, -4, -3, -2, -1, 1, 2, 3, 4, 5)
    print(a)
    return 0
}
