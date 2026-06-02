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
2
3
14
 */

class TestFinallyProp {
    public var x1: Int32 = 0
    public var x2: Int32 = 0

    public TestFinallyProp() {
        x1 = -1
        x2 = -1
    }

    public func aMethod(c: Int32): Unit {
        try {
            x1 = 37
            if (c < 5) {
                throw Exception()
            }
        } finally {
            x1 += 10
        }
    }

    public func validate(c: Int32): Unit {
        try {
            aMethod(c)
        } catch (e: Exception) {
            x1 /= 3
        }
        x1 /= 5
    }

    public static func TestMain(c: Int32): Int32 {
        var tt: TestFinallyProp = TestFinallyProp()
        tt.validate(c)
        var res: Int32 = tt.x1 + tt.x2
        return res + c
    }
}

main(): Int64 {
    print(TestFinallyProp.TestMain(0).toString() + "\n")
    print(TestFinallyProp.TestMain(1).toString() + "\n")
    print(TestFinallyProp.TestMain(6).toString() + "\n")
    return 0
}
