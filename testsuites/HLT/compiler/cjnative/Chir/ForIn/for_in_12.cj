/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan NegativeArraySizeException
enum E {
    T

    func test() {
        var a = 1..11
        var b = 0
        for (i in a) {
            throw NegativeArraySizeException("I am an Exception!")
        }
        return b
    }
}

main() {
    var a = E.T
    return a.test() - 31
}
