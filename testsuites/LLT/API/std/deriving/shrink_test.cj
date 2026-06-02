/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.collection.*
import std.deriving.*
import std.unittest.*
import std.unittest.prop_test.*
import std.unittest.testmacro.*

@Derive[Shrink]
enum EShr {
    | A
    | B(Int32)
    | C(Int64, Bool)
    | D(Option<Bool>, Bool, Int32, UInt8)
    | D(Option<Bool>)
}

@Derive[Shrink]
struct ShrinkDefaultCtor {
    ShrinkDefaultCtor() {}
}

@Derive[Shrink]
struct SShr {
    SShr(
        var a!: Int32,
        let b!: UInt16,
        public var c!: Option<Option<Bool>>,
        public let d!: Bool = true
    ) {}
}

@Derive[std.unittest.prop_test.Shrink]
struct ShrinkIndirectField {
    let a: Int64

    ShrinkIndirectField(a: Int64) {
        this.a = a
    }
}

@Derive[std.unittest.prop_test.Shrink]
struct ShrinkSingleField {
    ShrinkSingleField(var a: Int64) {}
}

@Test
class ShrinkTest {
    @TestCase
    func testShrinkA() {
        let a = EShr.A
        @Assert(a is Shrink<EShr>)
        @Assert(a.shrink().iterator().next().isNone())
    }

    @TestCase
    func testShrinkB() {
        let b = EShr.B(1234)
        @Assert(b is Shrink<EShr>)
        let shrunk = b.shrink() |> collectArray

        let shrunkA = shrunk |> filter<EShr> {
            it => match (it) {
                case A => true
                case _ => false
            }
        } |> collectArray

        @Assert(!shrunkA.isEmpty())

        let shrunkB = shrunk |> filter<EShr> {
            it => match (it) {
                case B(_) => true
                case _ => false
            }
        } |> collectArray

        @Assert(!shrunkB.isEmpty())
    }

    @TestCase
    func testShrinkC() {
        let c = EShr.C(1234, true)
        @Assert(c is Shrink<EShr>)
        let shrunk = c.shrink() |> collectArray

        let shrunkA = shrunk |> filter<EShr> {
            it => match (it) {
                case A => true
                case _ => false
            }
        } |> collectArray

        @Assert(!shrunkA.isEmpty())

        let shrunkC = shrunk |> filter<EShr> {
            it => match (it) {
                case C(_, _) => true
                case _ => false
            }
        } |> collectArray

        @Assert(!shrunkC.isEmpty())
    }

    @TestCase
    func testShrinkD4() {
        let d = EShr.D(Option<Bool>.None, true, 1234i32, 16u8)
        @Assert(d is Shrink<EShr>)
        let shrunk = d.shrink() |> collectArray

        let shrunkA = shrunk |> filter<EShr> {
            it => match (it) {
                case A => true
                case _ => false
            }
        } |> collectArray

        @Assert(!shrunkA.isEmpty())

        let shrunkD = shrunk |> filter<EShr> {
            it => match (it) {
                case D(_, _, _, _) => true
                case _ => false
            }
        } |> collectArray

        @Assert(!shrunkD.isEmpty())
    }

    @TestCase
    func testShrinkD1() {
        let d = EShr.D(true)
        @Assert(d is Shrink<EShr>)
        let shrunk = d.shrink() |> collectArray

        let shrunkA = shrunk |> filter<EShr> {
            it => match (it) {
                case A => true
                case _ => false
            }
        } |> collectArray

        @Assert(!shrunkA.isEmpty())

        let shrunkD = shrunk |> filter<EShr> {
            it => match (it) {
                case D(_) => true
                case _ => false
            }
        } |> collectArray

        @Assert(!shrunkD.isEmpty())
    }

    @TestCase
    func testShrinkDerivingDefaultCtor() {
        let shr = ShrinkDefaultCtor()
        @Assert(shr is Shrink<ShrinkDefaultCtor>)
        @Assert(shr.shrink().iterator().next().isNone())
    }

    @TestCase
    func testShrinkDeriving() {
        let shr = SShr(a: 0i32, b: 0u16, c: Option<Option<Bool>>.Some(Some(false)), d: true)
        @Assert(shr is Shrink<SShr>)
        let shrunk = shr.shrink()
        @Assert(shrunk.iterator().next().isSome())

        for (s in shrunk) {}
    }

    @TestCase
    func testIndirectField() {
        let shr = ShrinkIndirectField(20)
        @Assert(shr is Shrink<ShrinkIndirectField>)
        let shrunk = shr.shrink()
        @Assert(shrunk.iterator().next().isSome())
    }

    @TestCase
    func testConformity() {
        let value = 20
        let shr = ShrinkSingleField(value)
        @Assert(shr is Shrink<ShrinkSingleField>)
        let shrunk = shr.shrink().iterator()
        let shrunkExpected = value.shrink()

        for (expected in shrunkExpected) {
            @Assert(expected, shrunk.next().getOrThrow().a)
        }
        @Assert(shrunk.next().isNone())
    }
}
