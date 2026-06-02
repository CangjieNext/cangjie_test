/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// (not iOS) RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// (iOS) RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ArithmeticException
// ASSERT: scan throwable_20039.cj:26

var temp = 1

func f1() {
    return temp + 2
}

func test(): Int64 {
    var (a, b, c) = (1, 1, 3)
    try {
        a = f1()
        b = b / (a - 3)
        c = 3
        return a
    } catch (e: Exception) {
        e.printStackTrace()
        return a
    } finally {
        return b
    }
}

main() {
    test()
}
