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
-1
 */

class TestThrow1 {
    public var x1: Int32 = 0
    public var x2: Int32 = 0

    public TestThrow1() {
        x1 = -1
        x2 = -1
    }

    public func validate(age: Int32): Unit {
        if (age < 18) {
            x1 += 8
            throw ArithmeticException("not valid")
        } else {
            x1 /= 3
        }
    }

    public static func TestMain(c: Int32): Int32 {
        var tt: TestThrow1 = TestThrow1()
        try {
            tt.validate(c)
        } catch (e: Exception) {
        }
        var res: Int32 = tt.x1 + tt.x2
        return res
    }
}

main(): Int64 {
    print(TestThrow1.TestMain(13).toString() + "\n")
    print(TestThrow1.TestMain(21).toString() + "\n")
    return 0
}
