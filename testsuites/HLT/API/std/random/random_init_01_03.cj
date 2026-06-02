/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
import std.random.*

main() {
    var r = Random(8)
    var d1: UInt8 = 34
    var d2: UInt16 = 256
    var d3: UInt32 = 4294967294
    var d4: UInt64 = 18446744073709551615

    var d51: Int8 = 56
    var d61: Int16 = 32368
    var d71: Int32 = 2147483646
    var d81: Int64 = 2147483648

    var m1 = (r.nextUInt8(d1) <= d1)
    var m2 = (r.nextUInt16(d2) <= d2)
    var m3 = (r.nextUInt32(d3) <= d3)
    var m4 = (r.nextUInt64(d4) <= d4)
    var m6 = (r.nextInt8(d51) <= d51)
    var m8 = (r.nextInt16(d61) <= d61)
    var m10 = (r.nextInt32(d71) <= d71)
    var m12 = (r.nextInt64(d81) <= d81)
    if (m1 == false) {
        return 1
    }
    if (m2 == false) {
        return 2
    }
    if (m3 == false) {
        return 3
    }
    if (m4 == false) {
        return 4
    }
    if (m6 == false) {
        return 6
    }
    if (m8 == false) {
        return 8
    }
    if (m10 == false) {
        return 10
    }
    if (m12 == false) {
        return 12
    }

    return 0
}
