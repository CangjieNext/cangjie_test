// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f %overflowOpt -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main() {
    return testSigned() + testUnSigned()
}

func testSigned() {
    let x11 = -2 ** 39
    let x12 = -2 ** 38
    let x13 = -2 ** 0

    let x21 = 0 ** 0
    let x22 = 0 ** 5

    let x32 = 1 ** 0
    let x33 = 1 ** 100000
    let x41 = 3 ** 39

    if (x11 == -549755813888 && x12 == 274877906944 && x13 == 1 && x21 == 1 && x22 == 0 && x32 == 1 && x33 == 1 &&
        x41 == 4052555153018976267) {
        return 0
    }
    return 1
}

func testUnSigned() {
    let x21 = 0 ** UInt64(0)
    let x22 = 0 ** UInt64(5)
    let x32 = 1 ** UInt64(0)
    let x33 = 1 ** UInt64(100000)
    let x41 = 3 ** UInt64(39)
    if (x21 == 1 && x22 == 0 && x32 == 1 && x33 == 1 && x41 == 4052555153018976267) {
        return 0
    }
    return 1
}
