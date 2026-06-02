// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@OverflowWrapping
func testWrapping(x: Int16): Int16 {
    var res: Int16 = x
    res-- // 此时采用截断处理策略，不会抛异常。
    return res
}

@OverflowSaturating
func testSaturating(x: Int16): Int16 {
    var res: Int16 = x
    res-- // 此时采用饱和处理策略，不会抛异常。
    return res
}

@OverflowThrowing
func testThrowing(x: Int16): Int16 {
    var res: Int16 = x
    res-- // 此时采用抛异常策略。
    return res
}

main() {
    let MIN_INT16: Int16 = -32768
    let MAX_INT16: Int16 = 32767
    let a: Int16 = 16
    let b: Int16 = testWrapping(a)
    let c: Int16 = testSaturating(a)
    let d: Int16 = testThrowing(a)
    if ((b != 15) || (d != 15) || (d != 15)) {
        return 1
    }
    let ret: Int16 = testWrapping(MIN_INT16)
    if (ret != MAX_INT16) {
        return 1
    }
    let ret1: Int16 = testSaturating(MIN_INT16)
    if (ret1 != MIN_INT16) {
        return 1
    }
    return 0
}
