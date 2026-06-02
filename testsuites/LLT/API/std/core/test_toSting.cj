/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 

import std.collection.*
import std.math.*

@Test
class NumberToStringTest {
    @TestCase
    func Int64ToString(): Unit {
        let strInt64Min = Int64.Min.toString()
        @Expect(strInt64Min, "-9223372036854775808")
        let strInt64Max = Int64.Max.toString()
        @Expect(strInt64Max, "9223372036854775807")
    }

    @TestCase
    func UInt64ToString(): Unit {
        let strUInt64Max = UInt64.Max.toString()
        @Expect(strUInt64Max, "18446744073709551615")
    }
}
