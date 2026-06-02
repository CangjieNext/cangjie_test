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

class EA01 {
    public static func test1Snippet(): Int32 {
        var x: Int32 = 101
        return x
    }

    public static func test2Snippet(): Int32 {
        var x: Array<Int32> = []
        return Int32(x.size)
    }

    public static func test3Snippet(): Int32 {
        var x: Array<Int32> = [0]
        return x[0]
    }
}

main(): Int64 {
    var x1: Int32 = EA01.test1Snippet()
    var x2: Int32 = EA01.test2Snippet()
    var x3: Int32 = EA01.test3Snippet()
    if (x1 == 101 && x2 == 0 && x3 == 0) {
        print("pass")
    } else {
        print("fail")
    }
    return 0
}
