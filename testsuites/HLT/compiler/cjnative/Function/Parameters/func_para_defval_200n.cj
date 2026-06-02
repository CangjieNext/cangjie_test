/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

main(): Int64 {
    return run()
}

var m: Int32 = 0

func run(): Int64 {
    var x: Int32 = 10
    var y = 10
    var a8: (Int32) -> Int32 = foo8
    if (a8() != 1) {
        return 1
    }
    return 0
}

func foo8(a!: Int32 = 1): Int32 {
    return a
}

func foo3(): Unit {
    m = m + 1
}
// ASSERT: scan sema_wrong_number_of_arguments
