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
// ASSERT:scan 0

import std.collection.*

class Test {
    public static var intArray: Array<Int32> = [10, 20, 30, 12456789]
    public static var set: HashSet<Int32> = HashSet<Int32>()

    public static func test(para: Array<Int32>): Unit {
        var local: Array<Int32> = [23, 24]
        intArray = local
        var i: Int64 = 0
        while (i < para.size) {
            set.add(para[i])
            i++
        }
        print((0).toString())
    }
}

main(): Int64 {
    Test.test(Test.intArray)
    return 0
}
