/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var r1 = "ABCDE".toAsciiTitle()
    var r2 = "abcde".toAsciiTitle()
    var r3 = "仓颉字体".toAsciiTitle()
    var r4 = String().toAsciiTitle()
    var a5: Array<UInt8> = [65, 32, 66, 99] // A Bc
    var r5 = String.fromUtf8(a5[0..4]).toAsciiTitle()
    var r6 = "仓aBCDE 仓aBCDE".toAsciiTitle()
    if (r1 != "Abcde") {
        return 1
    }
    if (r2 != "Abcde") {
        return 2
    }
    if (r3 != "仓颉字体") {
        return 3
    }
    if (r4 != "") {
        return 4
    }
    if (r5 != "A Bc") {
        return 5
    }
    if (r6 != "仓Abcde 仓Abcde") {
        print("${r1}")
        return 6
    }

    return 0
}
