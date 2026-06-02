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
long
succ
 */

class UnwindMem {
    public static func zoo(a: Int32, b: Int32, c: Int32, d: Int32, e: Int32, f: Int32, g: Int32, h: Int32, i: Int32,
        j: Int32): Unit {
        print("long\n")
        throw ArithmeticException("Student is not eligible for registration")
    }
}

main(): Int64 {
    try {
        UnwindMem.zoo(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
    } catch (e: Exception) {
        print("succ\n")
    }
    return 0
}
