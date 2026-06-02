/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*

@Test
public class Test_Delta_PowerAssert_Float64 {
// @PowerAssert(leftExpr, rightExpr, delta: deltaExpr)
@TestCase
    func case_01(): Unit {
        let _delta = (Float64.Max / 1.001)
        @PowerAssert(1.7976931348623157e308, 0.01 * 1.7976931348623157e308, delta: _delta) // √
        @PowerAssert(0.1f64, (Float64.Max  / 1.001))
    }
}

/* SCAN-IN
    Assert Failed: `(0.1f64 == (Float64.Max / 1.001))`
                               |___________|       |
    179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.000000
                               |___________________|
    179589723762469127732510952207590308605129343313275008770386039446431745642627425141063683838909027637604304328082199480672580063537989127481301993246688101530711167026574742509809712389667739758184948408983133542388500252948482578554330667991490432841517561889231746889776235673861781532496270511661792624640.000000
*/