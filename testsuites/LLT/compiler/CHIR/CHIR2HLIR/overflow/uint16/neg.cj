// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@OverflowWrapping
func testWrapping(x: UInt16): UInt16 {
    -x // 此时采用截断处理策略，不会抛异常。
}

@OverflowSaturating
func testSaturating(x: UInt16): UInt16 {
    -x // 此时采用饱和处理策略，不会抛异常。
}

@OverflowThrowing
func testThrowing(x: UInt16): UInt16 {
    -x // 此时采用抛异常策略。
}

main() {
    let MIN_UINT16: UInt16 = 0
    let MAX_UINT16: UInt16 = 65535
    let a: UInt16 = MAX_UINT16
    let ret: UInt16 = testWrapping(a)
    if (ret != 1) {
        return 1
    }
    let ret1: UInt16 = testSaturating(a)
    if (ret1 != 0) {
        return 1
    }
    return 0
}
