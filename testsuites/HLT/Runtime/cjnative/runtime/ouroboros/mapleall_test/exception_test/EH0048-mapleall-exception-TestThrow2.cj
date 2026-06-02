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
3
4
 */

class E888_E <: Exception {}

class E999_E <: Exception {}

class E123_E <: Exception {}

class E456_234_123 <: Exception {}

class E234_123 <: Exception {}

class TestThrow2 {
    public var x1: Int32 = 0
    public var x2: Int32 = 0

    public TestThrow2() {
        x1 = -1
        x2 = -1
    }

    public func m(): Unit {
        throw E123_E()
    }

    public func n(): Unit {
        m()
    }

    public func p(): Unit {
        try {
            n()
        } catch (e: Exception) {
            x1 += 5
        }
    }

    public static func TestMain(c: Int32): Int32 {
        var tt: TestThrow2 = TestThrow2()
        tt.p()
        var res: Int32 = tt.x1 + tt.x2
        return res + c
    }
}

main(): Int64 {
    print(TestThrow2.TestMain(0).toString() + "\n")
    print(TestThrow2.TestMain(1).toString() + "\n")
    return 0
}
