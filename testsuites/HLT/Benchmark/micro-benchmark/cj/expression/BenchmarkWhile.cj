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
public class Test_While {

    static var sum = 0

    @Bench
    func BenchmarkWhileD1(): Unit {
        var n = 0
        sum = 0
        while (n < 100000) {
            n++
            sum += n / 2
        }
        blackBox(sum)
        blackBox(n)
    }

    @Bench
    func BenchmarkWhileD2(): Unit {
        var n = 0
        var m = 0
        sum = 0
        while (n < 1000) {
            n++
            m = 0
            while (m < 100) {
                m++
                sum += (n + m) / 2
            }
        }
        blackBox(sum)
        blackBox(n)
        blackBox(m)
    }

    @Bench
    func BenchmarkWhileD3(): Unit {
        var n = 0
        var m = 0
        var j = 0
        sum = 0
        while (n < 100) {
            n++
            m = 0
            while (m < 100) {
                m++
                j = 0
                while (j < 10) {
                    j++
                    sum += (n + m + j) / 2
                }
            }
        }
        blackBox(sum)
        blackBox(n)
        blackBox(m)
        blackBox(j)
    }

    @Bench
    func BenchmarkWhileD4(): Unit {
        var n = 0
        var m = 0
        var j = 0
        var k = 0
        sum = 0
        while (n < 100) {
            n++
            m = 0
            while (m < 10) {
                m++
                j = 0
                while (j < 10) {
                    j++
                    k = 0
                    while (k < 10) {
                        k++
                        sum += (n + m + j + k) / 2
                    }
                }
            }
        }
        blackBox(sum)
        blackBox(n)
        blackBox(m)
        blackBox(j)
        blackBox(k)
    }
}
