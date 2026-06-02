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
    var r1 = " ab cb ".trimAsciiEnd()
    var r2 = "".trimAsciiEnd()
    var r3 = "中国中".trimAsciiEnd()
    var r4 = String().trimAsciiEnd()
    var a5: Array<UInt8> = [32, 97, 32, 98, 99, 32]
    var r5 = String.fromUtf8(a5[0..6]).trimAsciiEnd()
    var r6 = String.fromUtf8([32u8, 65u8, 97u8, 32u8, 65u8, 9u8, 10u8, 11u8, 12u8, 13u8][0..10]).trimAsciiEnd()
    if (r1 != " ab cb") {
        return 1
    }
    if (r2 != "") {
        return 2
    }
    if (r3 != "中国中") {
        return 3
    }
    if (r4 != "") {
        return 4
    }
    if (r5 != " a bc") {
        return 5
    }
    if (r6 != " Aa A") {
        return 6
    }
    return 0
}
