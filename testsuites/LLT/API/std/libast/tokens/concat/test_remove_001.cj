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
    let tokens2 = tokens0.concat(tokens1)

    @TestCase
    func removeToken_01() {
        @ExpectThrows[IndexOutOfBoundsException](tokens2.remove(5))
        @ExpectThrows[IndexOutOfBoundsException](tokens2.remove(-1))
    }

    @TestCase
    func removeToken_02() {
        @Expect(tokens2.remove(0).toString(), "+ 2 + 3")
        @Expect(tokens2.remove(3).toString(), "1 + 2 3")
        @Expect(tokens2.remove(3)[1..=3].toString(), "+ 2 3")
        @ExpectThrows[IndexOutOfBoundsException](tokens2.remove(5))
    }
}