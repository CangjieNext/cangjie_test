/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %import-cangjie-stdx %optimization_level_2 %overflow_wrapping --no-sub-pkg %cmp_utest_opt -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run_stdx %output %run_utest_opt %run_args --bench --no-color

import std.time.*
import std.collection.*

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_Forin_Range {
    var sum = 0
    var _count = 0
    var size = 0
    var j = 0
    let _range = [1000, 1000_000, 1000_000_000]


    @BeforeEach
    public func GenerateSize(): Unit {
        size = _range[_count]
        _count += 1
    }

    @AfterEach
    public func Reset(): Unit {
        sum = 0
        j = 0
    }

    @Bench
    func BenchmarkWhile_N_1k(): Unit {
        while (j < size) {
            sum += j
            j++
        }
    }

    @Bench
    func BenchmarkWhile_N_1M(): Unit {
        while (j < size) {
            sum += j
            j++
        }
    }

    @Bench
    func BenchmarkWhile_N_1B(): Unit {
        while (j < size) {
            sum += j
            j++
        }
    }
}