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

func larger(a: Int32, b: Int32): Unit {
    if (a == b) {
        print("a is equal to b")
        return
    } else {
        print("a is not equal to b")
    }
}

main(): Int64 {
    larger(1, 2)
    return 0
}
