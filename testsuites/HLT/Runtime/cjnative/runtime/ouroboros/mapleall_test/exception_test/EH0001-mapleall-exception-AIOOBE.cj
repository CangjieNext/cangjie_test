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
7050328
7000329
 */

class AIOOBE {
    public static func TestMain(c: Int32): Int32 {
        var a: Array<Int32> = []
        if (c == 5) {
            a = [0, 0, 0, 0, 0]
        } else {
            a = [0, 0, 0, 0, 0, 0]
        }
        var c1: Int32 = c
        try {
            c1 += 300
            try {
                a[5] = 4
            } catch (e: IndexOutOfBoundsException) {
                c1 += 50000
            }
            c1 += 7000000
            a[4] = 23
        } catch (e: Exception) {
            c1 *= -1
        }
        return a[4] + c1
    }
}

main(): Int64 {
    print(AIOOBE.TestMain(5).toString() + "\n")
    print(AIOOBE.TestMain(6).toString() + "\n")
    return 0
}
