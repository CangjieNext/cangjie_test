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
class Test_fmod {
    @TestCase
    func test_fmod_01() {
        let x: Float16 = 3.3
        let y: Float16 = 2.2
        let fmod = fmod(x, y)
        @Expect(fmod.format(".1"), "1.1")
    }

    @TestCase
    func test_fmod_02() {
        let x: Float16 = 3.3
        let y: Float16 = -2.2
        let fmod = fmod(x, y)
        @Expect(fmod.format(".1"), "1.1")
    }

    @TestCase
    func test_fmod_03() {
        let x: Float16 = -3.3
        let y: Float16 = 2.2
        let fmod = fmod(x, y)
        @Expect(fmod.format(".1"), "-1.1")
    }

    @TestCase
    func test_fmod_04() {
        let x: Float16 = -3.3
        let y: Float16 = -2.2
        let fmod = fmod(x, y)
        @Expect(fmod.format(".1"), "-1.1")
    }
    @TestCase
    func test_fmod_05() {
        let x: Float16 = 0.0
        let y: Float16 = 1.0
        let fmod = fmod(x, y)
        @Expect(fmod.format(".1"), "0.0")
    }
    @TestCase
    func test_fmod_06() {
        let x: Float16 = -0.0
        let y: Float16 = 1.0
        let fmod = fmod(x, y)
        @Expect(fmod.format(".1"), "-0.0")
    }

    @TestCase
    func test_fmod_07() {
        let x: Float32 = 3.3
        let y: Float32 = 2.2
        let fmod = fmod(x, y)
        @Expect(fmod.format(".1"), "1.1")
    }

    @TestCase
    func test_fmod_08() {
        let x: Float64 = 3.3
        let y: Float64 = 2.2
        let fmod = fmod(x, y)
        @Expect(fmod.format(".1"), "1.1")
    }
}
