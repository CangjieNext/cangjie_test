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
108
9
155
303
 */

class DivideByZero {
    public static func TestMain(c: Int32): Int32 {
        var y: Int32 = c
        var r: Int32 = 0
        r += 1
        try {
            r += 2
            if (c > 100) {
                r += c
                r = r + 100 / (200 - c)
            } else {
                r += 5
                r = r + 100 / y
            }
        } catch (e: ArithmeticException) {
            r += 100
        }
        return r
    }
}

main(): Int64 {
    print(DivideByZero.TestMain(0).toString() + "\n")
    print(DivideByZero.TestMain(100).toString() + "\n")
    print(DivideByZero.TestMain(150).toString() + "\n")
    print(DivideByZero.TestMain(200).toString() + "\n")
    return 0
}
