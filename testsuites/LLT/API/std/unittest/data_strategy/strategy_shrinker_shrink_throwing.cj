/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args --no-color | compare %f
// ASSERT: scan [ PASSED ] CASE: testOkay1
// ASSERT: scan [ PASSED ] CASE: testOkay2
// ASSERT: scan-1 [ ERROR  ] CASE: testFailing
// ASSERT: scan in shrink
// ASSERT: scan shrink fail
// ASSERT: scan PASSED: 2, SKIPPED: 0, ERROR: 1

class StrategyFailingShrinkerShrink <: DataStrategy<Int64> & DataProvider<Int64> & DataShrinker<Int64> {
    StrategyFailingShrinkerShrink() {}

    public func provider(configuration: Configuration): DataProvider<Int64> {
        this
    }

    public func shrinker(configuration: Configuration): DataShrinker<Int64> {
        this
    }

    public func provide(): Iterable<Int64> {
        [1, 2, 3]
    }

    public prop isInfinite: Bool {
        get() {
            true
        } // to trigger shrinker
    }

    public func shrink(_: Int64): Iterable<Int64> {
        println("in shrink")
        throw Exception("shrink fail")
    }
}

@Test
class Test_DataStrategy_Shrinker_Shrink_Catching {
    @TestCase
    public func testOkay1() {}

    @TestCase[x in StrategyFailingShrinkerShrink()]
    public func testFailing(x: Int64) {
        @Assert(x != 1)
    }

    @TestCase
    public func testOkay2() {}
}
