/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan OverflowException

var temp: Int8 = 1

func f1() {
    return temp - 101
}

func f2() {
    return temp + 99
}

func test(a: Int8, b: Int8) {
    return a - b
}

main() {
    test(f1(), f2())
    return 0
}
