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

var Int8_MIN: Int8 = -0x80
var Int8_Max: Int8 = 0x7F
var a1: Array<Int8> = [Int8_MIN, Int8_MIN + 1, -1, 0, 1, 31, 32, 100, Int8_Max - 1, Int8_Max]
var a1s: Array<String> = ["-128", "-127", "-1", "0", "1", "31", "32", "100", "126", "127"]
var Int16_MIN: Int16 = -0x8000
var Int16_Max: Int16 = 0x7FFF
var a2: Array<Int16> = [Int16_MIN, Int16_MIN + 1, -1, 0, 1, 31, 32, 100, Int16_Max - 1, Int16_Max]
var a2s: Array<String> = ["-32768", "-32767", "-1", "0", "1", "31", "32", "100", "32766", "32767"]
var Int32_MIN: Int32 = -0X80000000
var Int32_Max: Int32 = 0x7FFFFFFF
var a3: Array<Int32> = [Int32_MIN, Int32_MIN + 1, -1, 0, 1, 31, 32, 100, Int32_Max - 1, Int32_Max]
var a3s: Array<String> = ["-2147483648", "-2147483647", "-1", "0", "1", "31", "32", "100", "2147483646", "2147483647"]
var Int64_MIN: Int64 = -0x8000000000000000
var Int64_Max: Int64 = 0X7FFFFFFFFFFFFFFF
var a4: Array<Int64> = [Int64_MIN, Int64_MIN + 1, -1, 0, 1, 31, 32, 100, Int64_Max - 1, Int64_Max]
var a4s: Array<String> = ["-9223372036854775808", "-9223372036854775807", "-1", "0", "1", "31", "32", "100",
    "9223372036854775806", "9223372036854775807"]
var a5 = [Int64_MIN, Int64_MIN + 1, -1, 0, 1, 31, 32, 100, Int64_Max - 1, Int64_Max]

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
    for (item in 0..a5.size) {
        if (a5[item].toString() != a4s[item]) {
            return 5
        }
    }
    return 0
}
