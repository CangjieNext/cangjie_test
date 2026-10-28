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

// An explicit order is applied by every derived interface

@Derive[ToString]
@DeriveOrder[b, a]
struct Reorder {
    let a = 1
    let b = 2
}

@Derive[ToString, Comparable]
@DeriveOrder[b, a]
struct Multi {
    Multi(let a: Int, let b: Int) {}
}

@Derive[ToString]
@DeriveOrder[q, p]
enum OrdEnum {
    | E1
    | E2(Int)

    @DeriveInclude
    prop p: Int { get() { 5 } }

    @DeriveInclude
    prop q: Int { get() { 6 } }
}

// An empty @DeriveOrder is equivalent to no @DeriveOrder at all

@Derive[ToString]
@DeriveOrder[]
struct NoMembers {}

@Derive[ToString]
@DeriveOrder[ /* only a comment */ ]
struct CommentOnly {}

@Derive[ToString]
@DeriveOrder[
]
struct NewlineOnly {}

@Derive[ToString]
@DeriveOrder[]
struct AllExcluded {
    @DeriveExclude
    var e = 1
}

@Derive[ToString]
@DeriveOrder[]
struct OnlyPlainProps {
    prop q: Int { get() { 2 } }
}

@Derive[ToString]
@DeriveOrder[]
enum NoIncludedProps {
    | B

    prop r: Int { get() { 3 } }
}

@Test
class OrderTest {
    @TestCase
    func reorderTest() {
        @Expect(Reorder().toString(), "Reorder(b: 2, a: 1)")
    }

    @TestCase
    func multiInterfaceTest() {
        let x = Multi(1, 9)
        let y = Multi(2, 1)

        @Expect(x.toString(), "Multi(b: 9, a: 1)")

        // the order [b, a] makes b the primary comparison key
        @Expect(x > y)
        @Expect(y < x)
    }

    @TestCase
    func enumOrderTest() {
        @Expect(OrdEnum.E1.toString(), "OrdEnum.E1(q: 6, p: 5)")
        @Expect(OrdEnum.E2(9).toString(), "OrdEnum.E2(9, q: 6, p: 5)")
    }

    @TestCase
    func emptyOrderTest() {
        @Expect(NoMembers().toString(), "NoMembers()")
        @Expect(CommentOnly().toString(), "CommentOnly()")
        @Expect(NewlineOnly().toString(), "NewlineOnly()")
        @Expect(AllExcluded().toString(), "AllExcluded()")
        @Expect(OnlyPlainProps().toString(), "OnlyPlainProps()")
        @Expect(NoIncludedProps.B.toString(), "NoIncludedProps.B")

        // properties that are not derived remain usable
        @Expect(OnlyPlainProps().q, 2)
        @Expect(NoIncludedProps.B.r, 3)
    }
}
