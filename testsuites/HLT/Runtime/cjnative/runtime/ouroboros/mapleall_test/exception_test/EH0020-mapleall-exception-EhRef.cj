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
100
1001
1002
1003
1004
1005
-1100
-4100
-55100
-33100
-55100
-99999100
0
-1
 */

class E888_E <: Exception {}

class E999_E <: Exception {}

class E123_E <: Exception {}

class E456_234_123 <: Exception {}

class E234_123 <: Exception {}

class EhRef {
    public static func TestMain(c: Int32): Int32 {
        var x: Int32
        var xxx: E123_E = E123_E()
        try {
            throw xxx
        } catch (e: E123_E) {
            x = c
        }
        return x
    }
}

main(): Int64 {
    print(EhRef.TestMain(100).toString() + "\n")
    print(EhRef.TestMain(1001).toString() + "\n")
    print(EhRef.TestMain(1002).toString() + "\n")
    print(EhRef.TestMain(1003).toString() + "\n")
    print(EhRef.TestMain(1004).toString() + "\n")
    print(EhRef.TestMain(1005).toString() + "\n")
    print(EhRef.TestMain(-1100).toString() + "\n")
    print(EhRef.TestMain(-4100).toString() + "\n")
    print(EhRef.TestMain(-55100).toString() + "\n")
    print(EhRef.TestMain(-33100).toString() + "\n")
    print(EhRef.TestMain(-55100).toString() + "\n")
    print(EhRef.TestMain(-99999100).toString() + "\n")
    print(EhRef.TestMain(0).toString() + "\n")
    print(EhRef.TestMain(-1).toString() + "\n")
    return 0
}
