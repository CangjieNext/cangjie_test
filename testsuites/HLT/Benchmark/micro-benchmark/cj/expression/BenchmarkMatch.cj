/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %import-cangjie-stdx %optimization_level_2 %overflow_wrapping --no-sub-pkg -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run_stdx %output %run_utest_opt %run_args

import stdx.encoding.json.*
import std.io.*
import std.time.*
import std.convert.*

let reps = 10000000
public var a: Int64 = 16
public var b: Float64 = 0.0
public var c: Rune = '~'
public var d: Int8 = 0

func benchmarkMatchD1() {
    for (i in 0..reps) {
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
    }
}

func benchmarkMatchD2() {
    for (i in 0..reps) {
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
    }
}

func benchmarkMatchD4() {
    for (i in 0..reps) {
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
    }
}

public enum Month {
    January | February | March | April | May | June | July | August | September | October | November | December
}
public var month: Month = December
/**
* Return Int64 value of the Month instance.
*
* @return a number represents the Month.
*/
func benchmarkMatchD6() {
    for (i in 0..reps) {
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
    }
}

func timeBenchmarkMatchD1(): Unit {
    var startTime = DateTime.now()
    benchmarkMatchD1()
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkMatchD1: " + perTime.format(".3") + " ns/op")
}

func timeBenchmarkMatchD2(): Unit {
    var startTime = DateTime.now()
    benchmarkMatchD2()
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkMatchD2: " + perTime.format(".3") + " ns/op")
}

func timeBenchmarkMatchD4(): Unit {
    var startTime = DateTime.now()
    benchmarkMatchD4()
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkMatchD4: " + perTime.format(".3") + " ns/op")
}

func timeBenchmarkMatchD6(): Unit {
    var startTime = DateTime.now()
    benchmarkMatchD6()
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkMatchD6: " + perTime.format(".3") + " ns/op")
}

main(): Int64 {
    timeBenchmarkMatchD1()
    timeBenchmarkMatchD2()
    timeBenchmarkMatchD4()
    timeBenchmarkMatchD6()
    println("a = ${a}, b = ${b}, c = ${c}, d = ${d}")
    return 0
}
