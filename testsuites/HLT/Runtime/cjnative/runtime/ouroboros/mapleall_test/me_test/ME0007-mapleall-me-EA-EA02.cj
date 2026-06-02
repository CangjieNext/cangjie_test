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

class TestClassInt {
    public var x: Int32 = 0
    public var y: Int32 = 0
    public TestClassInt(a: Int32, b: Int32) {
        x = a
        y = b
    }
}

class EA02 {
    public static func testMerge1Snippet(a: Int32): Int32 {
        var obj: TestClassInt = TestClassInt(1, 0)
        if (a < 0) {
            obj.x = obj.x + 1
        } else {
            obj.x = obj.x + 2
            obj.y = 0
        }
        if (obj.x > 1000) {
            return 1
        }
        return obj.y
    }
}

main(): Int64 {
    var x: Int32 = EA02.testMerge1Snippet(0)
    if (x == 0) {
        print("pass")
    } else {
        print("fail")
    }
    return 0
}
