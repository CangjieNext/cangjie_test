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

var temp: UInt32 = 0

func f1() {
    return temp + UInt32.Max
}

@OverflowWrapping
func testWrapping(x: UInt32, y: UInt32): UInt32 {
    return x * y
}

@OverflowSaturating
func testSaturating(x: UInt32, y: UInt32): UInt32 {
    return x * y
}

@OverflowThrowing
func testThrowing(x: UInt32, y: UInt32): UInt32 {
    return x * y
}

main() {
    let a: UInt32 = f1() / 8
    if (a.wrappingMul(16) != testWrapping(a, 16)) { // 此时采用截断处理策略，不会抛异常。
        return 1
    }
    if (a.saturatingMul(16) != testSaturating(a, 16)) { // 此时采用饱和处理策略，不会抛异常。
        return 2
    }
    var count = 0
    try {
        a.throwingMul(16) // 此时采用内部函数抛异常策略。
    } catch (e: OverflowException) {
        count++
    }
    try {
        testThrowing(a, 16) // 此时采用注解抛异常策略。
    } catch (e: OverflowException) {
        count++
    }
    if (count != 2) {
        return 3
    }
    return 0
}
