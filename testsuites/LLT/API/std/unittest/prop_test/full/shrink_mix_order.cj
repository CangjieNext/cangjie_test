/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --no-color | compare %f
// ASSERT: scan REASON: After 1 generation steps and 14 reduction steps:
// ASSERT: scan-not error

import std.unittest.*
import std.unittest.testmacro.*

class TestShrinker <: DataStrategy<Int64> & DataShrinker<Int64> {
    TestShrinker(let val: Array<Int64>) {}
    public func provider(configuration: Configuration): DataProvider<Int64> {
        [0]
    }
    public func shrinker(configuration: Configuration): DataShrinker<Int64> {
        this
    }
    public func shrink(value: Int64): Iterable<Int64> {
        this.val
    }
}

@Test
class TestShrinkMixing {
    let resultIter = [
        (1, 0, 0),
        (0, 1, 0),
        (0, 0, 1),
        (2, 0, 0),
        (0, 2, 0),
        (0, 0, 2),
        (3, 0, 0),
        (0, 3, 0),
        (0, 0, 3),
        (4, 0, 0),
        (0, 4, 0),
        (0, 0, 4),
        (0, 5, 0),
        (0, 6, 0)
    ].iterator()

    @TestCase[arg1 in TestShrinker([ 1, 2, 3, 4 ]), 
 arg2 in TestShrinker([ 1, 2, 3, 4, 5, 6 ]), 
 arg3 in TestShrinker([ 1, 2, 3, 4 ]), 
]
    func testB(arg1: Int64, arg2: Int64, arg3: Int64): Unit {
        let iter1 = [1, 2, 3, 4]
        let iter2 = [1, 2, 3, 4, 5, 6]
        let iter3 = [1, 2, 3, 4]

        if ((arg1, arg2, arg3) == (0, 0, 0)) {
            @Assert(false)
        }

        let expected = resultIter.next().getOrThrow()

        if ((arg3, arg2, arg1) != (expected[0], expected[1], expected[2])) {
            println("(${arg3},${arg2},${arg1})  (${expected[0]},${expected[1]},${expected[2]})")
            println("error")
        }
    }
}
