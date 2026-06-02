/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 1>log.txt && bash -c "dos2unix log.txt" && bash -c "cat log.txt" | compare %f
/* SCAN-IN
6
101
6
6
 */

class DivideByZero3 {
    public static func throwdiv0(n: Int32, m: Int32): Int32 {
        return m / n
    }

    public static func callthrowdiv0(n: Int32, m: Int32): Int32 {
        var x: Int32 = n - 100
        return throwdiv0(x, m)
    }

    public static func TestMain(c: Int32): Int32 {
        var y: Int32 = c
        var r: Int32 = 0
        r += 1
        try {
            var a = callthrowdiv0(c, r)
            r += 5
        } catch (e: ArithmeticException) {
            r += 100
        }
        return r
    }
}

main(): Int64 {
    print(DivideByZero3.TestMain(0).toString() + "\n")
    print(DivideByZero3.TestMain(100).toString() + "\n")
    print(DivideByZero3.TestMain(150).toString() + "\n")
    print(DivideByZero3.TestMain(200).toString() + "\n")
    return 0
}
