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
101
110
 */

class TestUnwind2 {
    public var x1: Int32 = 0

    public TestUnwind2() {
        x1 = -1
    }

    public func testEx(): Bool {
        var ret: Bool = true
        try {
            throw Exception()
        } catch (e: Exception) {
            ret = false
            throw e
        } finally {
            if (ret) {
                x1 += 11
            }
            x1 /= 3
        }
        return ret
    }

    public static func TestMain(c: Int32): Int32 {
        var testException1: TestUnwind2 = TestUnwind2()
        try {
            testException1.testEx()
            return testException1.x1 + c
        } catch (e: Exception) {
            return testException1.x1 + c + 100
        }
    }
}

main(): Int64 {
    print(TestUnwind2.TestMain(1).toString() + "\n")
    print(TestUnwind2.TestMain(10).toString() + "\n")
    return 0
}
