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

var IntNative_MIN: IntNative = -0x8000000000000000
var IntNative_Max: IntNative = 0X7FFFFFFFFFFFFFFF // if Not run on 64bit,will error
var a4: Array<IntNative> = [IntNative_MIN, IntNative_MIN + 1, -1, 0, 1, 31, 32, 100, IntNative_Max - 1, IntNative_Max]
var a4s: Array<String> = ["-9223372036854775808", "-9223372036854775807", "-1", "0", "1", "31", "32", "100",
    "9223372036854775806", "9223372036854775807"]
var UIntNative_MIN: UIntNative = 0x0000000000000000
var UIntNative_Max: UIntNative = 0XFFFFFFFFFFFFFFFF
var aa4: Array<UIntNative> = [UIntNative_MIN, UIntNative_MIN + 1, 31, 32, 100, UIntNative_Max - 1, UIntNative_Max]
var aa4s: Array<String> = ["0", "1", "31", "32", "100", "18446744073709551614", "18446744073709551615"]

main(): Int64 {
    for (item in 0..a4.size) {
        if (a4[item].toString() != a4s[item]) {
            return 1
        }
    }
    for (item in 0..aa4.size) {
        if ((!aa4[item]).toString() == (aa4s[item])) {
            return 2
        }
    }
    return 0
}
