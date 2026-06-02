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
    var r1 = "ab cb".isAsciiBlank() // false
    var r2 = "".isAsciiBlank() // true
    var r3 = "中国中".isAsciiBlank() // false
    var r4 = String().isAsciiBlank() // true
    var a5: Array<UInt8> = [97, 9, 98, 99]
    var r5 = String.fromUtf8(a5[0..4]).isAsciiBlank() //false
    var r6 = String.fromUtf8([32u8, 9u8, 10u8, 11u8, 12u8, 13u8][0..6]).isAsciiBlank() // true
    var r11 = " ".isAsciiBlank() // 32
    var r12 = String.fromUtf8([9u8][0..1]).isAsciiBlank()
    var r13 = String.fromUtf8([10u8][0..1]).isAsciiBlank()
    var r14 = String.fromUtf8([11u8][0..1]).isAsciiBlank()
    var r15 = String.fromUtf8([12u8][0..1]).isAsciiBlank()
    var r16 = String.fromUtf8([13u8][0..1]).isAsciiBlank()

    if (r1) {
        return 1
    }
    if (!r2) {
        return 2
    }
    if (r3) {
        return 3
    }
    if (!r4) {
        return 4
    }
    if (r5) {
        return 5
    }
    if (!r6) {
        return 6
    }
    if (!r11 || !r12 || !r13 || !r14 || !r15 || !r16) {
        return 6
    }
    return 0
}
