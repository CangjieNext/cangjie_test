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
/* SCAN-IN
103
104
 */

class TestException2 {
    public var x1: Int32 = 0
    public var x2: Int32 = 0
    public var x3: Int32 = 0

    public TestException2() {
        x1 = -1
        x2 = -1
        x3 = -1
    }

    public func testEx(): Bool {
        var ret: Bool = true
        try {
            ret = testEx1()
        } catch (e: Exception) {
            ret = false
            throw e
        } finally {
            if (ret) {
                x3 = 1
            } else {
                x3 = 0
            }
            x1 /= 3
            x2 /= 3
        }
        return ret
    }

    public func testEx1(): Bool {
        var ret: Bool = true
        try {
            ret = testEx2()
            x1 += 13
            if (!ret) {
                return false
            }
            x2 += 11
        } catch (e: Exception) {
            x2 /= 3
            ret = false
            throw e
        } finally {
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
            x2 += 19
            ret = false
            throw e
        } finally {
            x1 /= 3
        }
        return ret
    }

    public static func TestMain(c: Int32): Int32 {
        var testException1: TestException2 = TestException2()
        try {
            testException1.testEx()
            return testException1.x1 + testException1.x2 + testException1.x3 + c
        } catch (e: Exception) {
            return testException1.x1 + testException1.x2 + testException1.x3 + c + 100
        }
    }
}

main(): Int64 {
    print(TestException2.TestMain(0).toString() + "\n")
    print(TestException2.TestMain(1).toString() + "\n")
    return 0
}
