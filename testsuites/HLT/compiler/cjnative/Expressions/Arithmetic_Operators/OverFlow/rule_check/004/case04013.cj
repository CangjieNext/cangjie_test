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
// ASSERT: scan ArithmeticException: Overshift

func test() {
    var b = 5
    func temp() {
        b += 5
        var a: Int8 = 10
        return a
    }

    let a: Int8 = temp() >> b
    return a
}

main() {
    test()
    1
}
