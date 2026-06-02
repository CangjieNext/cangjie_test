// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@OverflowWrapping
func testWrapping(x: Int32): Int32 {
    var res: Int32 = x
    res++ // 此时采用截断处理策略，不会抛异常。
    return res
}

@OverflowSaturating
func testSaturating(x: Int32): Int32 {
    var res: Int32 = x
    res++ // 此时采用饱和处理策略，不会抛异常。
    return res
}

@OverflowThrowing
func testThrowing(x: Int32): Int32 {
    var res: Int32 = x
    res++ // 此时采用抛异常策略。
    return res
}

main() {
    let MIN_INT32: Int32 = -2147483648
    let MAX_INT32: Int32 = 2147483647
    let a: Int32 = 15
    let b: Int32 = testWrapping(a)
    let c: Int32 = testSaturating(a)
    let d: Int32 = testThrowing(a)
    if ((b != 16) || (d != 16) || (d != 16)) {
        return 1
    }
    let ret: Int32 = testWrapping(MAX_INT32)
    if (ret != MIN_INT32) {
        return 1
    }
    let ret1: Int32 = testSaturating(MAX_INT32)
    if (ret1 != MAX_INT32) {
        return 1
    }

    return 0
}
