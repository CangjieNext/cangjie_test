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
4
53
 */

class E888_E <: Exception {}

class E999_E <: Exception {}

class E123_E <: Exception {}

class E456_234_123 <: Exception {}

class E234_123 <: Exception {}

class EhTh {
    public static func TestMain(c: Int32): Int32 {
        var r: Int32 = 3
        try {
            if (c > 0) {
                throw E123_E()
            }
            r += 1
        } catch (e: E123_E) {
            r += 50
        }
        return r
    }
}

main(): Int64 {
    print(EhTh.TestMain(0).toString() + "\n")
    print(EhTh.TestMain(1).toString() + "\n")
    return 0
}
