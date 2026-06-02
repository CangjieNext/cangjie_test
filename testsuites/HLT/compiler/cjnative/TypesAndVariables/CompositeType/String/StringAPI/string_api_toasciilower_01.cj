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
    var r1 = "ABC Abc?AbC".toAsciiLower()
    var r2 = "abc".toAsciiLower()
    var r3 = "仓颉".toAsciiLower()
    var r4 = String().toAsciiLower()
    var a5 = [65u8, 32u8, 66u8, 99u8]
    var r5 = String.fromUtf8(a5[0..4]).toAsciiLower()

    if (r1 != "abc abc?abc") {
        return 1
    }
    if (r2 != "abc") {
        return 2
    }
    if (r3 != "仓颉") {
        return 3
    }
    if (r4 != "") {
        return 4
    }
    if (r5 != "a bc") {
        return 5
    }
    return 0
}
