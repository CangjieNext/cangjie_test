/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan pass

class NotInlining {
    public static func notInlineable(): Unit {}
}

class TestClassInt {
    public var x: Int32 = 0
    public var y: Int32 = 0
    public TestClassInt(a: Int32, b: Int32) {
        x = a
        y = b
    }
}

class EA04 {
    public func testSimpleLoopSnippet(a: Int32): Int32 {
        var obj: TestClassInt = TestClassInt(1, 2)
        var i: Int32 = 0
        while (i < a) {
            NotInlining.notInlineable()
            i++
        }
        return obj.x
    }

    public func testModifyingLoopSnippet(a: Int32): Int32 {
        var obj: TestClassInt = TestClassInt(1, 2)
        var i: Int32 = 0
        while (i < a) {
            obj.x = 3
            NotInlining.notInlineable()
            i++
        }
        if (obj.x <= 3) {
            return 1
        } else {
            return 0
        }
    }
}

main(): Int64 {
    var ea: EA04 = EA04()
    var x1: Int32 = ea.testSimpleLoopSnippet(10)
    var x2: Int32 = ea.testModifyingLoopSnippet(10)
    if (x1 == 1 && x2 == 1) {
        print("pass")
    } else {
        print("fail")
    }
    return 0
}
