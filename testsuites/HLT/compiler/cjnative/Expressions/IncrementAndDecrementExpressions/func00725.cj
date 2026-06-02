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
func test(a: Int64): Int64 {
    var b = a - 1
    b--
    if (b != 0) {
        test(b)
    }
    return b
}

main(): Int64 {
    var a: Int64 = 10
    test(a)
    return 0
}
