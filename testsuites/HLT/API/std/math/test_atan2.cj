/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output --test
// RUN-EXEC: %run %run_opt %output %run_args

import std.math.*
import std.convert.Formattable

@Test
class Test_math {
    @TestCase
    func test_atan2_01() {
        let y: Float16 = 1.0
        let x: Float16 = 1.0
        let atan2 = atan2(y, x) / Float16.GetPI() * 180.0
        @Expect("${atan2.format(".1")}°", "45.0°")
    }

    @TestCase
    func test_atan2_02() {
        let y: Float16 = 1.0
        let x: Float16 = -1.0
        let atan2 = atan2(y, x) / Float16.GetPI() * 180.0
        @Expect("${atan2.format(".1")}°", "135.0°")
    }

    @TestCase
    func test_atan2_03() {
        let y: Float16 = -1.0
        let x: Float16 = -1.0
        let atan2 = atan2(y, x) / Float16.GetPI() * 180.0
        @Expect("${atan2.format(".1")}°", "-135.0°")
    }

    @TestCase
    func test_atan2_04() {
        let y: Float16 = -1.0
        let x: Float16 = 1.0
        let atan2 = atan2(y, x) / Float16.GetPI() * 180.0
        @Expect("${atan2.format(".1")}°", "-45.0°")
    }

    @TestCase
    func test_atan2_05() {
        let y: Float16 = 0.0
        let x: Float16 = -1.0
        let atan2 = atan2(y, x) / Float16.GetPI() * 180.0
        @Expect("${atan2.format(".1")}°", "180.0°")
    }

    @TestCase
    func test_atan2_06() {
        let y: Float16 = -0.0
        let x: Float16 = -1.0
        let atan2 = atan2(y, x) / Float16.GetPI() * 180.0
        @Expect("${atan2.format(".1")}°", "-180.0°")
    }

    @TestCase
    func test_atan2_07() {
        let y: Float16 = 0.0
        let x: Float16 = 1.0
        let atan2 = atan2(y, x) / Float16.GetPI() * 180.0
        @Expect("${atan2.format(".1")}°", "0.0°")
    }

    @TestCase
    func test_atan2_08() {
        let y: Float16 = -0.0
        let x: Float16 = 1.0
        let atan2 = atan2(y, x) / Float16.GetPI() * 180.0
        @Expect("${atan2.format(".1")}°", "-0.0°")
    }

    @TestCase
    func test_atan2_09() {
        let y: Float32 = 1.0
        let x: Float32 = 1.0
        let atan2 = atan2(y, x) / Float32.GetPI() * 180.0
        @Expect("${atan2.format(".1")}°", "45.0°")
    }

    @TestCase
    func test_atan2_10() {
        let y: Float64 = 1.0
        let x: Float64 = 1.0
        let atan2 = atan2(y, x) / Float64.GetPI() * 180.0
        @Expect("${atan2.format(".1")}°", "45.0°")
    }
}
