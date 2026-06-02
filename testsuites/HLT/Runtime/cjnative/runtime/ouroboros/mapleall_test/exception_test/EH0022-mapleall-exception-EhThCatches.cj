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
103
103
103
 */

class EhClass <: Exception {
    public static var serialVersionUID: Int64 = 123
    public var n123: Int32 = 0
    public EhClass() {
        n123 = 123
    }
}

class EhThCatches {
    public static func TestMain(c: Int32): Int32 {
        var r: Int32 = 3
        try {
            if (c > 10) {
                throw EhClass()
            } else if (c < 100) {
                throw ArithmeticException()
            }
            r += 1
        } catch (e: EhClass | ArithmeticException) {
            r += 100
        }
        return r
    }
}

main(): Int64 {
    print(EhThCatches.TestMain(0).toString() + "\n")
    print(EhThCatches.TestMain(22).toString() + "\n")
    print(EhThCatches.TestMain(101).toString() + "\n")
    return 0
}
