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

@Test
class EquatableTest {
    @TestCase
    func smokeTest() {
        let a = SOrdering(1, 2)
        let b = SOrdering(2, 3)

        assertALessB(a, b)
    }

    @TestCase
    func smokeTest2() {
        let a = SOrdering(1, 2)
        let b = SOrdering(1, 3)

        assertALessB(a, b)
    }

    @TestCase
    func equalTest() {
        let a = SOrdering(1, 4)
        let b = SOrdering(1, 4)

        assertAEqB(a, b)
    }

    @TestCase
    func reverseTest() {
        let a = SOrderingEx(2, 3)
        let b = SOrderingEx(1, 2)

        assertAGreaterB(a, b)
    }

    @TestCase
    func reverseTest2() {
        let a = SOrderingEx(2, 3)
        let b = SOrderingEx(1, 3)

        @Expect(a != b)
        @Expect(!(a == b))
        @Expect(a > b)
        @Expect(a >= b)
        @Expect(b < a)
        @Expect(b <= a)
        @Expect(a.compare(b), GT)
        @Expect(b.compare(a), LT)
    }

    @TestCase
    func reverseTest3() {
        let a = SOrderingReverse1(1)
        let b = SOrderingReverse1(2)

        @Expect(a != b)
        @Expect(!(a == b))
        @Expect(a > b)
        @Expect(a >= b)
        @Expect(b < a)
        @Expect(b <= a)
        @Expect(a.compare(b), GT)
        @Expect(b.compare(a), LT)
    }

    @TestCase
    func enumTest() {
        assertAEqB(EOrdering.EOrd1, EOrdering.EOrd1)
        assertAEqB(EOrdering.EOrd2(1), EOrdering.EOrd2(1))
        assertAEqB(EOrdering.EOrd3(1, 2), EOrdering.EOrd3(1, 2))

        assertALessB(EOrdering.EOrd1, EOrdering.EOrd2(1))
        assertALessB(EOrdering.EOrd1, EOrdering.EOrd3(1, 2))
        assertALessB(EOrdering.EOrd2(1), EOrdering.EOrd3(1, 2))
        assertALessB(EOrdering.EOrd2(1), EOrdering.EOrd2(2))
        assertALessB(EOrdering.EOrd3(1, 1), EOrdering.EOrd3(2, 2))
        assertALessB(EOrdering.EOrd3(1, 1), EOrdering.EOrd3(1, 2))
        assertALessB(EOrdering.EOrd3(1, 3), EOrdering.EOrd3(2, 2))

        assertAGreaterB(EOrdering.EOrd2(1), EOrdering.EOrd1)
    }

    @TestCase
    func enumPropertiesTest() {
        @Assert(EqualId(1) == EqualId(2))

        assertAEqB(EOrdering2.EOrdering21(EqualId(1)), EOrdering2.EOrdering21(EqualId(1)))

        assertALessB(EOrdering2.EOrdering21(EqualId(1)), EOrdering2.EOrdering21(EqualId(2)))
        assertAGreaterB(EOrdering2.EOrdering21(EqualId(3)), EOrdering2.EOrdering21(EqualId(2)))
    }

    private func assertALessB<T>(a: T, b: T): Unit where T <: Comparable<T> {
        @Expect(a != b)
        @Expect(!(a == b))
        @Expect(a < b)
        @Expect(a <= b)
        @Expect(b > a)
        @Expect(b >= a)
        @Expect(a.compare(b), LT)
        @Expect(b.compare(a), GT)
    }

    private func assertAGreaterB<T>(a: T, b: T): Unit where T <: Comparable<T> {
        @Expect(a != b)
        @Expect(!(a == b))
        @Expect(a > b)
        @Expect(a >= b)
        @Expect(b < a)
        @Expect(b <= a)
        @Expect(a.compare(b), GT)
        @Expect(b.compare(a), LT)
    }

    private func assertAEqB<T>(a: T, b: T): Unit where T <: Comparable<T> {
        @Expect(a == b)
        @Expect(!(a != b))
        @Expect(!(a < b))
        @Expect(a <= b)
        @Expect(!(b > a))
        @Expect(b >= a)
        @Expect(a.compare(b), EQ)
        @Expect(b.compare(a), EQ)
    }
}

@Derive[Comparable]
struct SOrdering {
    SOrdering(
        let b: Int,
        let c: Int
    ) {}

    let a = 0

    @DeriveInclude
    prop d: Int {
        get() {
            b
        }
    }

    prop e: Int {
        get() {
            c
        }
    }
}

@Derive[Comparable]
@DeriveOrder[b, a]
struct SOrderingEx {
    SOrderingEx(
        let a: Int,
        let b: Int
    ) {}
}

@Derive[Comparable]
struct SOrderingReverse1 {
    SOrderingReverse1(@DeriveExclude let b: Int) {}

    @DeriveInclude
    prop a: Int {
        get() {
            -b
        }
    }
}

@Derive[Comparable]
enum EOrdering {
    | EOrd1
    | EOrd2(Int)
    | EOrd3(Int, Int)
}

@Derive[Comparable]
enum EOrdering2 {
    | EOrdering21(EqualId)

    @DeriveInclude
    prop a: Int {
        get() {
            match (this) {
                case EOrdering21(id) => id.id
            }
        }
    }
}

@Derive[Comparable]
struct EqualId {
    EqualId(@DeriveExclude let id: Int) {}
}
