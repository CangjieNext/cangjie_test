/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan f!f!f!catch!
// ASSERT: regex catch!java.lang.ArithmeticException: / by zero|ArithmeticException: Divided by zero
// ASSERT: scan throwable_20004.cj:21
func test() {
    var i: Int64 = 0
    var n = [1, 2, 3, 4, 5]

    while (i <= 4) {
        try {
            n[i] = 10 / (i - 2)
        } catch (e: Error) {
        } finally {
            i++
            print("f!") // should print 3*f!
        }
    }
}

main() {
    var n = [1, 2, 3]
    var res = 3
    try {
        test()
    } catch (e: ArithmeticException) {
        print("catch!");
        e.printStackTrace();
        res = 0
    }
    return res
}
