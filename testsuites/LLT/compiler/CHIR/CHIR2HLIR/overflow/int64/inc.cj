// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@OverflowWrapping
func testWrapping(x: Int64): Int64 {
    var res: Int64 = x
    res++ // 此时采用截断处理策略，不会抛异常。
    return res
}

@OverflowSaturating
func testSaturating(x: Int64): Int64 {
    var res: Int64 = x
    res++ // 此时采用饱和处理策略，不会抛异常。
    return res
}

@OverflowThrowing
func testThrowing(x: Int64): Int64 {
    var res: Int64 = x
    res++ // 此时采用抛异常策略。
    return res
}

main() {
    let MIN_INT64: Int64 = -9223372036854775808
    let MAX_INT64: Int64 = 9223372036854775807
    let a: Int64 = 15
    let b: Int64 = testWrapping(a)
    let c: Int64 = testSaturating(a)
    let d: Int64 = testThrowing(a)
    if ((b != 16) || (d != 16) || (d != 16)) {
        return 1
    }
    let ret: Int64 = testWrapping(MAX_INT64)
    if (ret != MIN_INT64) {
        return 1
    }
    let ret1: Int64 = testSaturating(MAX_INT64)
    if (ret1 != MAX_INT64) {
        return 1
    }
    return 0
}
