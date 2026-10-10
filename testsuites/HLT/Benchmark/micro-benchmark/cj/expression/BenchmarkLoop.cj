/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %import-cangjie-stdx -O2 %overflow_wrapping --no-sub-pkg --test -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run_stdx %output %run_utest_opt %run_args --bench --no-color


import std.time.*
import std.runtime.*

@Test
@Configure[minDuration: Duration.second * 3]
@Configure[warmup: Duration.second]
@Measure[TimeNow(Nanos)]
public class Test_Loop {

    static var sum = 0

    @Bench
    func BenchmarkLoopD1(): Unit {
        sum = 0
        for (j in 0..100000) {
            sum += j / 2
        }
        blackBox(sum)
    }

    @Bench
    func BenchmarkLoopD2(): Unit {
        sum = 0
        for (j in 0..1000) {
            for (k in 0..100) {
                sum += (j + k) / 2
            }
        }
        blackBox(sum)
    }

    @Bench
    func BenchmarkLoopD3(): Unit {
        sum = 0
        for (j in 0..100) {
            for (k in 0..100) {
                for (l in 0..10) {
                    sum += (j + k + l) / 2
                }
            }
        }
        blackBox(sum)
    }

    @Bench
    func BenchmarkLoopD4(): Unit {
        sum = 0
        for (j in 0..100) {
            for (k in 0..10) {
                for (l in 0..10) {
                    for (m in 0..10) {
                        sum += (j + k + l + m) / 2
                    }
                }
            }
        }
        blackBox(sum)
    }
}
