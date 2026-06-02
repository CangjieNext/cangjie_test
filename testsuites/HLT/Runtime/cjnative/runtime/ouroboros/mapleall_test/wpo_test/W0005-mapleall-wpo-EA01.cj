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
// ASSERT:scan passed

func test1Snippet(): Int32 {
    let x: Int32 = Int32(101)
    return x
}

func test2Snippet(): Int32 {
    let x = Array<Int32>()
    return Int32(x.size)
}

func test3Snippet(): Int32 {
    let x: Array<Int32> = [0]
    return x[0]
}

main(): Int64 {
    let x1: Int32 = test1Snippet()
    let x2: Int32 = test2Snippet()
    let x3: Int32 = test3Snippet()
    if (x1 == 101 && x2 == 0 && x3 == 0) {
        print("passed")
    } else {
        print("failed")
    }
    return 0
}
