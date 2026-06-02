// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@OverflowWrapping
func testWrapping(x: UInt64, y: UInt64): UInt64 {
    return x * y // 此时采用截断处理策略，不会抛异常。
}

@OverflowSaturating
func testSaturating(x: UInt64, y: UInt64): UInt64 {
    return x * y // 此时采用饱和处理策略，不会抛异常。
}

@OverflowThrowing
func testThrowing(x: UInt64, y: UInt64): UInt64 {
    return x * y // 此时采用抛异常策略。
}

main() {
    let MIN_UINT64: UInt64 = 0
    let MAX_UINT64: UInt64 = 18446744073709551615
    let a: UInt64 = MAX_UINT64 / 2 + 1
    let b: UInt64 = 4
    // wrapping
    let ret: UInt64 = testWrapping(16, 4) // normal
    if (ret != 64) {
        return 1
    }
    let ret1: UInt64 = testWrapping(a, b) // max overflow
    if (ret1 != 0) {
        return 1
    }
    // saturating
    let ret2: UInt64 = testSaturating(16, 4) // normal
    if (ret2 != 64) {
        return 1
    }
    let ret3: UInt64 = testSaturating(a, b) // max overflow
    if (ret3 != MAX_UINT64) {
        return 1
    }
    // throwing
    let ret4: UInt64 = testThrowing(16, 4) // normal
    if (ret4 != 64) {
        return 1
    }
    return 0
}
