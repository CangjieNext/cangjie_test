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
import std.unittest.prop_test.*
import std.unittest.testmacro.*
import std.random.Random

@Derive[std.unittest.prop_test.Arbitrary]
class AnotherArb {
    AnotherArb() {}
}

open class Another {}

@Derive[std.unittest.prop_test.Arbitrary where S <: Another]
class Arb<T, S> where T <: Arbitrary<T>, S <: Another {
    Arb(let t: T) {}

    func another(s: S): S {
        s
    }
}

@Derive[std.unittest.prop_test.Arbitrary where S <: Another]
enum ArbEnum<T, S> where T <: Arbitrary<T>, S <: Another {
    | A
    | B(T)

    func another(s: S): S {
        s
    }
}

@Test
class ArbitraryTTest {
    @TestCase[a in random()]
    func testArbT1(a: Arb<AnotherArb, Another>) {
        @Assert(a.t is AnotherArb)
        @Assert(a.another(Another()) is Another)
    }

    @TestCase[a in random()]
    func testArbT2(a: Arb<Int64, Another>) {
        @Assert(a.t is Int64)
        @Assert(a.another(Another()) is Another)
    }

    @TestCase[a in random()]
    func testArbTEnum1(a: ArbEnum<AnotherArb, Another>) {
        match (a) {
            case B(t) => @Assert(t is AnotherArb)
            case _ => ()
        }

        @Assert(a.another(Another()) is Another)
    }

    @TestCase[a in random()]
    func testArbTEnum2(a: ArbEnum<Int64, Another>) {
        match (a) {
            case B(t) => @Assert(t is Int64)
            case _ => ()
        }

        @Assert(a.another(Another()) is Another)
    }
}
