/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex item: 5
// ASSERT: regex item: 6
// ASSERT: regex item: 7

import std.collection.*

class Test {
    public var a: HashSet<Int32> = HashSet<Int32>([5, 6, 7, 5])
    public var b: HashSet<Int32>
    public init(x: HashSet<Int32>) {
        b = x
    }
    public func f(x: HashSet<Int32>): HashSet<Int32> {
        return x
    }
}

func run(): Int64 {
    var setOne: HashSet<Int32> = HashSet<Int32>([5, 6, 7, 5])
    var test: Test = Test(setOne)
    var res1: HashSet<Int32> = test.a
    var res2: HashSet<Int32> = test.b
    var res3: HashSet<Int32> = test.f(setOne)
    if (res1 == res2 && res2 == res3) {
        for (item in res1.iterator()) { // TO DO set.iterator()
            print("item: " + item.toString() + "\n")
        }
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
