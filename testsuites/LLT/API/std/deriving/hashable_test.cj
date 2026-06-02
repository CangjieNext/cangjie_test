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
class HashableTest {
    @TestCase
    func s1() {
        let s = S1(2)
        var expected = DefaultHasher()
        expected.write(s.f1)
        expected.write(s.f2)

        @Expect(s.hashCode(), expected.finish())
    }

    @TestCase
    func en() {
        let h11 = E1.E11.hashCode()
        let h12 = E1.E12.hashCode()
        let h13_a = E1.E13("a").hashCode()
        let h13_b = E1.E13("b").hashCode()

        @Expect(h11, hash(0))
        @Expect(h12, hash(1))
        @Expect(h13_a, hash(2, "a"))
        @Expect(h13_b, hash(2, "b"))

        @Expect(h11 != h12)
        @Expect(h13_a != h13_b)
        @Expect(h11 != h13_a)
        @Expect(h11 != h13_b)
        @Expect(h12 != h13_a)
        @Expect(h12 != h13_b)
    }

    private static func hash(items: Array<Hashable>): Int {
        var hasher = DefaultHasher()
        for (item in items) {
            match (item) {
                case item: Int => hasher.write(item)
                case item: String => hasher.write(item)
                case _ => hasher.write(item.hashCode())
            }
        }
        return hasher.finish()
    }
}

@Derive[Hashable]
struct S1 {
    var f1 = 1
    S1(var f2: Int) {}
}

@Derive[Hashable]
enum E1 {
    | E11
    | E12
    | E13(String)
}
