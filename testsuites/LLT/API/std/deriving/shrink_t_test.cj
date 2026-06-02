/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args --no-color

import std.deriving.*
import std.unittest.prop_test.*
import std.unittest.testmacro.*
import std.collection.collectArray
import std.collection.filter

@Derive[std.unittest.prop_test.Shrink]
class AnotherShr {
    AnotherShr() {}
}

open class Another {}

@Derive[std.unittest.prop_test.Shrink where S <: Another]
class Shr<T, S> where T <: Shrink<T>, S <: Another {
    Shr(let t: T) {}

    func another(s: S): S {
        s
    }
}

@Derive[std.unittest.prop_test.Shrink where S <: Another]
enum ShrEnum<T, S> where T <: Shrink<T>, S <: Another {
    | A
    | B(T)

    func another(s: S): S {
        s
    }
}

@Test
class ShrinkTest {
    @TestCase
    func testShrT1() {
        let a = Shr<AnotherShr, Another>(AnotherShr())
        @Assert(a is Shrink<Shr<AnotherShr, Another>>)
        @Assert(a.t is AnotherShr)
        @Assert(a.another(Another()) is Another)
        @Assert(a.shrink().iterator().next().isNone())
    }

    @TestCase
    func testShrT2() {
        let a = Shr<Int64, Another>(512)
        @Assert(a is Shrink<Shr<Int64, Another>>)
        @Assert(a.t is Int64)
        @Assert(a.another(Another()) is Another)
        @Assert(a.shrink().iterator().next().getOrThrow().t != a.t)
    }

    @TestCase
    func testShrTEnum1() {
        let ens = [
            ShrEnum<AnotherShr, Another>.A,
            ShrEnum<AnotherShr, Another>.B(AnotherShr())
        ]

        for (en in ens) {
            @Assert(en.another(Another()) is Another)

            match (en) {
                case B(t) =>
                    @Assert(t is AnotherShr)
                    let isNextA = match (en.shrink().iterator().next()) {
                        case Some(A) => true
                        case _ => false
                    }
                    @Assert(isNextA)
                case A => @Assert(en.shrink().iterator().next().isNone())
            }
        }
    }

    @TestCase
    func testShrTEnum2() {
        let ens = [
            ShrEnum<Int64, Another>.A,
            ShrEnum<Int64, Another>.B(1234)
        ]

        for (en in ens) {
            @Assert(en.another(Another()) is Another)

            match (en) {
                case B(t) =>
                    @Assert(t is Int64)
                    let shrunk = en.shrink() |> collectArray
                    let shrunkA = shrunk |>
                        filter<ShrEnum<Int64, Another>> {
                        it => match (it) {
                            case A => true
                            case _ => false
                        }
                    } |> collectArray
                    @Assert(!shrunkA.isEmpty())

                    let shrunkB = shrunk |>
                        filter<ShrEnum<Int64, Another>> {
                        it => match (it) {
                            case B(_) => true
                            case _ => false
                        }
                    } |> collectArray
                    @Assert(!shrunkB.isEmpty())

                case A => @Assert(en.shrink().iterator().next().isNone())
            }
        }
    }
}
