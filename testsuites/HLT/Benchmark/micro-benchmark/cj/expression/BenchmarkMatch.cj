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

public enum Month {
    January | February | March | April | May | June | July | August | September | October | November | December
}

@Test
@Configure[minDuration: Duration.second * 3]
@Configure[warmup: Duration.second]
@Measure[TimeNow(Nanos)]
public class Test_Match {

    static var a: Int64 = 16
    static var b: Float64 = 0.0
    static var month: Month = December

    @Bench
    func BenchmarkMatchD1(): Unit {
        b = match (a) {
            case 1 => 1.5
            case 2 => 2.5
            case 3 => 3.5
            case 4 => 4.5
            case 5 => 5.5
            case 6 => 6.5
            case 7 => 7.5
            case 8 => 8.5
            case 9 => 9.5
            case 10 => 10.5
            case 11 => 11.5
            case 12 => 12.5
            case 13 => 13.5
            case 14 => 14.5
            case 15 => 15.5
            case _ => 16.5
        }
        blackBox(a)
    }

    @Bench
    func BenchmarkMatchD2(): Unit {
        b = match (a) {
            case 1 => 1.5
            case 2 => 2.5
            case 3 => 3.5
            case 4 => 4.5
            case 5 => 5.5
            case 6 => 6.5
            case 7 => 7.5
            case 8 => 8.5
            case 9 => 9.5
            case 10 => 10.5
            case 11 => 11.5
            case 12 => 12.5
            case 13 => 13.5
            case 14 => 14.5
            case _ =>
                match (a) {
                    case 15 => 15.5
                    case _ => 16.6
                }
        }
        blackBox(a)
    }

    @Bench
    func BenchmarkMatchD4(): Unit {
        b = match (a) {
            case 1 => 1.5
            case 2 => 2.5
            case 3 => 3.5
            case 4 => 4.5
            case 5 => 5.5
            case 6 => 6.5
            case 7 => 7.5
            case 8 => 8.5
            case 9 => 9.5
            case 10 => 10.5
            case 11 => 11.5
            case 12 => 12.5
            case 13 => 13.5
            case 14 => 14.5
            case _ =>
                match (a) {
                    case n =>
                        match (a) {
                            case k =>
                                match (a) {
                                    case _ => 15.5
                                }
                        }
                }
        }
        blackBox(a)
    }

    @Bench
    func BenchmarkMatchD6(): Unit {
        a = match (month) {
            case January => 1
            case February => 2
            case March => 3
            case April => 4
            case May => 5
            case June => 6
            case July => 7
            case August => 8
            case September => 9
            case October => 10
            case November => 11
            case December => 12
        }
        blackBox(a)
    }
}
