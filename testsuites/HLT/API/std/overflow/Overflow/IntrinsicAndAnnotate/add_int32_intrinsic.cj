/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 
import std.overflow.*
import std.math.*

var temp: Int32 = 0

func f1() {
    return temp + Int32.Max
}

func f2() {
    return temp + Int32.Min
}

@OverflowWrapping
func testWrapping(x: Int32, y: Int32): Int32 {
    return x + y
}

@OverflowSaturating
func testSaturating(x: Int32, y: Int32): Int32 {
    return x + y
}

@OverflowThrowing
func testThrowing(x: Int32, y: Int32): Int32 {
    return x + y
}

main() {
    let a: Int32 = f1()
    let b: Int32 = f2()
    if (a.wrappingAdd(1) != testWrapping(a, 1) || b.wrappingAdd(-1) != testWrapping(b, -1)) { // 此时采用截断处理策略，不会抛异常。
        return 1
    }
    if (a.saturatingAdd(1) != testSaturating(a, 1) || b.saturatingAdd(-1) != testSaturating(b, -1)) { // 此时采用饱和处理策略，不会抛异常。
        return 2
    }
    var count = 0
    try {
        a.throwingAdd(1) // 此时采用内部函数抛异常策略。
    } catch (e: OverflowException) {
        count++
    }
    try {
        b.throwingAdd(-1) // 此时采用内部函数抛异常策略。
    } catch (e: OverflowException) {
        count++
    }
    try {
        testThrowing(a, 1) // 此时采用注解抛异常策略。
    } catch (e: OverflowException) {
        count++
    }
    try {
        testThrowing(b, -1) // 此时采用注解抛异常策略。
    } catch (e: OverflowException) {
        count++
    }
    if (count != 4) {
        return 3
    }
    return 0
}
