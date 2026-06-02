/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args

import std.math.*
import std.convert.*

@Test
class Test_func_min_max_30 {
    @TestCase
    func test_func_min_01(): Unit {
        @Expect(min(Int8(-1), Int8(0)), -1)
        @Expect(min(UInt32(0), UInt32(200)), 0)
        @Expect(Float16.min(Float16(5), Float16.NaN).isNaN())
        @Expect(Float64.min(Float64(-4.12), Float64(0.0)), Float64(-4.12))
        @Expect(Float32.min(Float32(-4.12), Float32(0.0)), Float32(-4.12))
        @Expect(min(Int8(0), Int8(0)), 0)
    }

    @TestCase
    func test_func_max_02(): Unit {
        @Expect(max(Int8(-1), Int8(0)), 0)
        @Expect(max(UInt32(0), UInt32(200)), 200)
        @Expect(Float16.max(Float16(5), Float16.NaN).isNaN())
        @Expect(Float64.max(Float64(-4.12), Float64(0.0)), Float64(0.0))
        @Expect(Float32.max(Float32(-4.12), Float32(0.0)), Float32(0.0))
        @Expect(max(Int8(0), Int8(0)), 0)
    }
}
