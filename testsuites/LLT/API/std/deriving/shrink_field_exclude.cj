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

@Derive[std.unittest.prop_test.Shrink]
struct ShExcludeField {
    ShExcludeField(@DeriveExclude let a: Int64) {}
}

@Derive[std.unittest.prop_test.Shrink]
struct ShFieldsExclude {
    ShFieldsExclude(
        @DeriveExclude let a: Int64,
        @DeriveExclude let b: Int8,
        var c!: String
    ) {}
}

@Test
class ShrinkTest {
    @TestCase
    func testShrinkExcludeField() {
        let shr = ShExcludeField(35)
        @Assert(shr is Shrink<ShExcludeField>)
        @Assert(shr.shrink().iterator().next().isNone())
    }

    @TestCase
    func testShrinkFieldsExclude() {
        let a = 35
        let b = 93i8
        let c = "Any string"
        let shr = ShFieldsExclude(a, b, c: c)
        @Assert(shr is Shrink<ShFieldsExclude>)

        for (shrunk in shr.shrink()) {
            @Assert(b, shrunk.b)
            @Assert(a, shrunk.a)
            @Assert(shrunk.c != c)
        }
    }
}
