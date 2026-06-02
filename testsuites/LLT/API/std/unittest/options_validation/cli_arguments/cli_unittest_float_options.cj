/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt 
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args --optf16=1.0 --optf32=-0.34334 --optf64=0.0 --long=42.0

// NOTE: the test check that option floating point types can be guessed by provided CLI argument

@UnittestOption[Float16](optf16)

@UnittestOption[Float32, Bool](optf32)

@UnittestOption[Float64](optf64)

@UnittestOption[Float64, Float32](long)

@Test
func float_long_types_prefered_to_short() {
    let conf = defaultConfiguration()

    @Assert(conf.get<Float64>(KeyLong.long) == 42.0)
    @Assert(conf.get<Float32>(KeyLong.long).isNone())
}
