/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 105

class TestUnwind {
    public var x1: Int32 = 0

    public TestUnwind() {
        x1 = -1
    }

    public func testEx(): Bool {
        var ret: Bool = true
        try {
            ret = testEx2()
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

    public func testEx2(): Bool {
        var ret: Bool = true
        try {
            var b: Int32 = 12
            var c: Int32
            var i: Int32 = 2
            while (i >= -2) {
                c = b / i
                x1 += 17
                i--
            }
        } catch (e: Exception) {
            x1 += 5
            throw e
        } finally {
            x1 /= 3
        }
        return ret
    }

    public static func TestMain(c: Int32): Int32 {
        var testException1: TestUnwind = TestUnwind()
        try {
            testException1.testEx()
            return testException1.x1 + c
        } catch (e: Exception) {
            return testException1.x1 + c + 100
        }
    }
}

main(): Int64 {
    print(TestUnwind.TestMain(1))
    return 0
}
