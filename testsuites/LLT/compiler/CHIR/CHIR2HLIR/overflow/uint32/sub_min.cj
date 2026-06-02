// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@OverflowWrapping
func testWrapping(x: UInt32, y: UInt32): UInt32 {
    return x - y // 此时采用截断处理策略，不会抛异常。
}

@OverflowSaturating
func testSaturating(x: UInt32, y: UInt32): UInt32 {
    return x - y // 此时采用饱和处理策略，不会抛异常。
}

@OverflowThrowing
func testThrowing(x: UInt32, y: UInt32): UInt32 {
    return x - y // 此时采用抛异常策略。
}

main() {
    let MIN_UINT32: UInt32 = 0
    let MAX_UINT32: UInt32 = 4294967295
    let a: UInt32 = 15
    // wrapping
    let ret: UInt32 = testWrapping(a, 15) // min
    if (ret != 0) {
        return 1
    }
    let ret1: UInt32 = testWrapping(a, 16) // min overflow
    if (ret1 != MAX_UINT32) {
        return 1
    }
    // saturating
    let ret2: UInt32 = testSaturating(a, 15) // min
    if (ret2 != 0) {
        return 1
    }
    let ret3: UInt32 = testSaturating(a, 16) // min overflow
    if (ret3 != 0) {
        return 1
    }
    // throwing
    let ret4: UInt32 = testThrowing(a, 15) // min
    if (ret4 != 0) {
        return 1
    }
    return 0
}
