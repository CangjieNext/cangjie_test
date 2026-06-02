// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 

@OverflowWrapping
func testWrapping(x: Int64, y: Int64): Int64 {
    var res = x
    res -= y // 此时采用截断处理策略，不会抛异常。
    return res
}

@OverflowSaturating
func testSaturating(x: Int64, y: Int64): Int64 {
    var res = x
    res -= y // 此时采用饱和处理策略，不会抛异常。
    return res
}

@OverflowThrowing
func testThrowing(x: Int64, y: Int64): Int64 {
    var res = x
    res -= y // 此时采用抛异常策略。
    return res
}

main() {
    let MIN_INT64: Int64 = -9223372036854775808
    let MAX_INT64: Int64 = 9223372036854775807
    let a: Int64 = MAX_INT64 - 15
    // wrapping
    let ret: Int64 = testWrapping(16, 4) // normal
    if (ret != 12) {
        return 1
    }
    let ret1: Int64 = testWrapping(a, -16) // max overflow
    if (ret1 != MIN_INT64) {
        return 1
    }
    // saturating
    let ret2: Int64 = testSaturating(16, 4) // normal
    if (ret2 != 12) {
        return 1
    }
    let ret3: Int64 = testSaturating(a, -16) // max overflow
    if (ret3 != MAX_INT64) {
        return 1
    }
    let ret4: Int64 = testSaturating(0, MIN_INT64) // max overflow
    if (ret4 != MAX_INT64) {
        return 1
    }
    // throwing
    let ret5: Int64 = testThrowing(16, 4) // normal
    if (ret5 != 12) {
        return 1
    }
    return 0
}
