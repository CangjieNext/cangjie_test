/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.unittest.prop_test.*
import std.collection.*

@Test
class ShrinkHelperMixTest {
    @TestCase
    func testMixSimple1() {
        let s1 = [1, 1, 1]
        let s2 = LazySeq.of([2, 2])

        let expected = ArrayList<Int64>([1, 2, 1, 2, 1])
        let actual = ArrayList<Int64>(5)

        for (v in ShrinkHelpers.mix<Int64>(s1, s2)) {
            v |> actual.add
        }

        @Assert(expected, actual)
    }

    @TestCase
    func testMixSimple2() {
        let s1 = [1, 1]
        let s2 = LazySeq.of([2, 2, 2])

        let expected = ArrayList<Int64>([1, 2, 1, 2, 2])
        let actual = ArrayList<Int64>(5)

        for (v in ShrinkHelpers.mix<Int64>(s1, s2)) {
            v |> actual.add
        }

        @Assert(expected, actual)
    }

    @TestCase
    func testMixSimple3() {
        let s1 = [1, 1, 1]
        let s2 = LazySeq.of([2, 2, 2])

        let expected = ArrayList<Int64>([1, 2, 1, 2, 1, 2])
        let actual = ArrayList<Int64>(6)

        for (v in ShrinkHelpers.mix<Int64>(s1, s2)) {
            v |> actual.add
        }

        @Assert(expected, actual)
    }

    @TestCase
    func testMixEmpty() {
        let empty = Array<Int64>()
        let mixed = ShrinkHelpers.mix<Int64>(empty)

        for (v in mixed) {
            @Assert(false) // No values expected to be in 'mixed'
        }
    }

    @TestCase
    func testMixNested() {
        let s1 = [1, 1]
        let s2 = LazySeq.of([2, 2])

        let s3 = [3, 3, 3]
        let s4 = [4, 4]

        let expected = ArrayList<Int64>([1, 2, 3, 4, 1, 2, 3, 4, 3])
        let actual = ArrayList<Int64>(9)

        for (v in ShrinkHelpers.mix<Int64>(s1, s2, ShrinkHelpers.mix<Int64>(s3, s4))) {
            v |> actual.add
        }

        @Assert(expected, actual)
    }
}
