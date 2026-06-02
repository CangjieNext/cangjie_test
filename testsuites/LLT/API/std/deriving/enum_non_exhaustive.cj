/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.deriving.*
import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.prop_test.*
import std.random.Random

@Test
class NonExhaustiveTest {
    @TestCase
    func toString() {
        @Expect("E.A", E.A.toString())
    }

    @TestCase
    func hashable() {
        @Expect(E.A.hashCode() != 0)
    }

    @TestCase
    func comparableEquatable() {
        @Expect(E.A == E.A)
        @Expect(E.A < E.B)
        // no need to cover all cases as they are already covered in the corresponding test
        // we only check than non-exhaustive case is working
    }

    @TestCase
    func shrink() {
        E.A.shrink()
    }

    @TestCase
    func arbitrary() {
        E.arbitrary(Random())
    }
}

@Derive[ToString, Hashable, Comparable, Equatable, Shrink, Arbitrary]
enum E {
    A | B | ...
}
