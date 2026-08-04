/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping --no-sub-pkg %cmp_utest_opt -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run %run_opt %output %run_utest_opt %run_args --bench --no-color

import std.time.*

// 因为cangjie 使用 固定值 item 构造时实际上取的是引用，故二三维数组使用lambda表达式构造
// 构造更大的数组时OOM

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_Array_Init { 

    static var arr : Array<Array<Int64>> = []

    @Bench[len in [32, 256, 2048]]
    func BenchmarkArrayInitializationD2_N(len: Int64): Unit {
        arr = Array<Array<Int64>>(len, {int: Int64 => Array<Int64>(len, repeat: 0)})
    }

    @Bench[len in [32, 256, 2048]]
    func BenchmarkArrayInitDataD2_N(len: Int64): Unit {
        arr = Array<Array<Int64>>(len, {int: Int64 => Array<Int64>(len, {index: Int64 => index})})
    }

}
