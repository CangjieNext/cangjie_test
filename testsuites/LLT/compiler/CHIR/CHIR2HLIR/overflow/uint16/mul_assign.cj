// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@OverflowWrapping
func testWrapping(x: UInt16, y: UInt16): UInt16 {
    var res = x
    res *= y // 此时采用截断处理策略，不会抛异常。
    return res
}

@OverflowSaturating
func testSaturating(x: UInt16, y: UInt16): UInt16 {
    var res = x
    res *= y // 此时采用饱和处理策略，不会抛异常。
    return res
}

@OverflowThrowing
func testThrowing(x: UInt16, y: UInt16): UInt16 {
    var res = x
    res *= y // 此时采用抛异常策略。
    return res
}

main() {
    let MIN_UINT16: UInt16 = 0
    let MAX_UINT16: UInt16 = 65535
    let a: UInt16 = MAX_UINT16 / 2 + 1
    let b: UInt16 = 4
    // wrapping
    let ret: UInt16 = testWrapping(16, 4) // normal
    if (ret != 64) {
        return 1
    }
    let ret1: UInt16 = testWrapping(a, b) // max overflow
    if (ret1 != 0) {
        return 1
    }
    // saturating
    let ret2: UInt16 = testSaturating(16, 4) // normal
    if (ret2 != 64) {
        return 1
    }
    let ret3: UInt16 = testSaturating(a, b) // max overflow
    if (ret3 != MAX_UINT16) {
        return 1
    }
    // throwing
    let ret4: UInt16 = testThrowing(16, 4) // normal
    if (ret4 != 64) {
        return 1
    }
    return 0
}
