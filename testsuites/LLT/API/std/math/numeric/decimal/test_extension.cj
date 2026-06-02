/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 

import std.math.numeric.*

@Test
class DecimalExtensionTest {
    @TestCase
    func parseable_tryParse_test(): Unit {
        @Expect(Decimal.tryParse("-123.456").toString(), "Some(-123.456)")
        @Expect(Decimal.tryParse("+123.456").toString(), "Some(123.456)")
        @Expect(Decimal.tryParse("0000000000000123.456").toString(), "Some(123.456)")
        @Expect(Decimal.tryParse("-0001.2346e+02").toString(), "Some(-123.46)")
        @Expect(Decimal.tryParse("").toString(), "None")
        @Expect(Decimal.tryParse("#123.456").toString(), "None")
    }

    @TestCase
    func formattable_format_test(): Unit {
        let v = Decimal.parse("123.456")
        @Expect(v.format("-10.2"), "123.46    ")
        @Expect(v.format("+10.4"), " +123.4560")
        @Expect(v.format("010.2"), "0000123.46")
        @Expect(v.format("010.2g"), "0001.2e+02")
        @Expect(v.format("010.4g"), "00000123.5")
        @Expect(v.format("010.4e"), "1.2346e+02")
    }
}
