/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.ast.{Token, Tokens}
import std.unittest.*
import std.unittest.testmacro.*

@Test
class Test {
    let tokens0 = quote(1 + 2)
    let tokens1 = quote(+ 3)
    let tokens2 = tokens0 + tokens1

    @TestCase
    func subscriptAccess_01() {
        @ExpectThrows[IndexOutOfBoundsException](tokens0[3])
        @ExpectThrows[IndexOutOfBoundsException](tokens2[5])
    }

    @TestCase
    func subscriptAccess_02() {
        @Expect(tokens2[0].value, "1")
        @Expect(tokens2[1].value, "+")
        @Expect(tokens2[2].value, "2")
        @Expect(tokens2[3].value, "+")
        @Expect(tokens2[4].value, "3")
        @ExpectThrows[IndexOutOfBoundsException](tokens2[5])
    }

    @TestCase
    func subscriptRangeAccess_01() {
        @ExpectThrows[IndexOutOfBoundsException](tokens2[-1..2])
        @ExpectThrows[IndexOutOfBoundsException](tokens2[1..8])
        @ExpectThrows[IllegalArgumentException](tokens2[0..=4 : 2])
    }

    @TestCase
    func subscriptRangeAccess_02() {
        @Expect(tokens2[0..1].toString(), "1")
        @Expect(tokens2[0..=1].toString(), "1 +")
        @Expect(tokens2[0..2].toString(), "1 +")
        @Expect(tokens2[0..=2].toString(), "1 + 2")
        @Expect(tokens2[0..=4].toString(), "1 + 2 + 3")
        @Expect(tokens2[1..5].toString(), "+ 2 + 3")
    }
}