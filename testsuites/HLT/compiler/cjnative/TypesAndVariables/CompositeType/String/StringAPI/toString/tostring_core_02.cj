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

var UInt8_MIN: UInt8 = 0x00
var UInt8_Max: UInt8 = 0xFF
var a1: Array<UInt8> = [UInt8_MIN, UInt8_MIN + 1, 31, 32, 100, UInt8_Max - 1, UInt8_Max]
var a1s: Array<String> = ["0", "1", "31", "32", "100", "254", "255"]
var UInt16_MIN: UInt16 = 0x0
var UInt16_Max: UInt16 = 0xFFFF
var a2: Array<UInt16> = [UInt16_MIN, UInt16_MIN + 1, 31, 32, 100, UInt16_Max - 1, UInt16_Max]
var a2s: Array<String> = ["0", "1", "31", "32", "100", "65534", "65535"]
var UInt32_MIN: UInt32 = 0X00000000
var UInt32_Max: UInt32 = 0xFFFFFFFF
var a3: Array<UInt32> = [UInt32_MIN, UInt32_MIN + 1, 31, 32, 100, UInt32_Max - 1, UInt32_Max]
var a3s: Array<String> = ["0", "1", "31", "32", "100", "4294967294", "4294967295"]
var UInt64_MIN: UInt64 = 0x0000000000000000
var UInt64_Max: UInt64 = 0XFFFFFFFFFFFFFFFF
var a4: Array<UInt64> = [UInt64_MIN, UInt64_MIN + 1, 31, 32, 100, UInt64_Max - 1, UInt64_Max]
var a4s: Array<String> = ["0", "1", "31", "32", "100", "18446744073709551614", "18446744073709551615"]

main(): Int64 {
    for (item in 0..a1.size) {
        if (a1[item].toString() != a1s[item]) {
            return 1
        }
    }
    for (item in 0..a2.size) {
        if (a2[item].toString() != a2s[item]) {
            return 2
        }
    }
    for (item in 0..a3.size) {
        if (a3[item].toString() != a3s[item]) {
            return 3
        }
    }
    for (item in 0..a4.size) {
        if (a4[item].toString() != a4s[item]) {
            return 4
        }
    }
    return 0
}
