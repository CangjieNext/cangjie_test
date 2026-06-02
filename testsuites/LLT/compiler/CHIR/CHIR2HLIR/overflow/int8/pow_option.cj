// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt --int-overflow wrapping %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func testWrapping(x: Int64, y: UInt64): Int8 {
    Int8(x ** y) // wrapping
}

@OverflowSaturating
func testSaturating(x: Int64, y: UInt64): Int8 {
    Int8(x ** y) // saturating
}

main() {
    let MIN_INT8: Int8 = -128
    let MAX_INT8: Int8 = 127
    let a = testWrapping(4, 3)
    let b = testSaturating(4, 3)
    if ((a != 64) || (b != 64)) {
        return 1
    }
    let ret = testWrapping(4, 4)
    if (ret != 0) {
        return 1
    }
    let ret1 = testSaturating(4, 4)
    if (ret1 != MAX_INT8) {
        return 1
    }
    return 0
}
