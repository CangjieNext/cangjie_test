/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
import std.convert.*

main(): Int64 {
    var i1: Int8 = -0b10000000
    var i2: Int16 = -0o100000
    var i3: Int32 = -0x80000000
    var i4: Int64 = -0X8000000000000000

    var i5: Int8 = 0X7f
    var i6: Int16 = 0O77777
    var i7: Int32 = 0B1111111111111111111111111111111
    var i8: Int64 = 9223372036854775807

    var u1: UInt8 = 0b11111111
    var u2: UInt16 = 0o177777
    var u3: UInt32 = 0O37777777777
    var u4: UInt64 = 0Xffffffffffffffff

    var u5: UInt8 = 0

    var flags = '-'
    var width = 20
    var precision = 8
    var special = 'x'
    var res1 = i1.format("${flags}${width}.${precision}X")
    var res2 = i2.format("${flags}${width}.${precision}O")
    var res3 = i3.format("${flags}${width}.${precision}B")
    var res4 = i4.format("${flags}${width}.${precision}b")
    var res5 = i5.format("${flags}${width}.${precision}b")
    var res6 = i6.format("${flags}${width}.${precision}")
    var res7 = i7.format("${flags}${width}.${precision}x")
    var res8 = i8.format("${flags}${width}.${precision}b")
    var res9 = u1.format("${flags}${width}.${precision}x")
    var res10 = u2.format("${flags}${width}.${precision}")
    var res11 = u3.format("${flags}${width}.${precision}b")
    var res12 = u4.format("${flags}${width}.${precision}o")
    var res13 = u5.format("${flags}${width}.${precision}x")

    if (res1 != "-00000080           ") {
        return 1
    }
    if (res2 != "-00100000           ") {
        return 2
    }
    if (res3 != "-10000000000000000000000000000000") {
        return 3
    }
    if (res4 != "-1000000000000000000000000000000000000000000000000000000000000000") {
        return 4
    }
    if (res5 != "01111111            ") {
        return 5
    }
    if (res6 != "00032767            ") {
        return 6
    }
    if (res7 != "7fffffff            ") {
        return 7
    }
    if (res8 != "111111111111111111111111111111111111111111111111111111111111111") {
        return 8
    }
    if (res9 != "000000ff            ") {
        return 9
    }
    if (res10 != "00065535            ") {
        return 10
    }
    if (res11 != "11111111111111111111111111111111") {
        return 11
    }
    if (res12 != "1777777777777777777777") {
        return 12
    }
    if (res13 != "00000000            ") {
        return 13
    }

    return 0
}
