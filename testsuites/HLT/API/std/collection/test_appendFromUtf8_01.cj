/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output 
// RUN-EXEC: %run %run_opt %output %run_args

main() {
    var strb1 = StringBuilder()
    var strb2 = StringBuilder()
    var a1: Array<UInt8> = [0, 127, 194, 128, 223, 191, 224, 160, 128, 239, 191, 191, 240, 144, 128, 128]
    var a2: Array<UInt8> = [0, 127, 127, 0]

    var b1: Array<UInt8> = [128]
    var b2: Array<UInt8> = [191]
    var b3: Array<UInt8> = [254]
    var b4: Array<UInt8> = [192, 192]
    var b5: Array<UInt8> = [239, 127, 100]
    var b6: Array<UInt8> = [240, 255, 128, 192]
    var b7: Array<UInt8> = [248, 128, 128, 128, 127]
    var b8: Array<UInt8> = [253, 128, 192, 191, 128, 191]

    var c1: Array<UInt8> = [127, 192, 224, 128, 128]
    var c2: Array<UInt8> = [224, 128, 240, 128, 128, 128]
    var c3: Array<UInt8> = [0, 253, 0, 128, 128, 128, 128, 128]

    var count: Int64 = 0
    var sum: Int64 = 0

    strb1.appendFromUtf8(a1)
    strb2.appendFromUtf8(a2)
    var s1 = strb1.toString().toArray()
    var s2 = strb2.toString().toArray()
    if (a1 == s1) {
        sum += 1
    }
    if (a2 == s2) {
        sum += 1
    }

    try {
        strb1.appendFromUtf8(b1)
    } catch (e: IllegalArgumentException) {
        count += 1
    }
    try {
        strb1.appendFromUtf8(b2)
    } catch (e: IllegalArgumentException) {
        count += 1
    }
    try {
        strb1.appendFromUtf8(b3)
    } catch (e: IllegalArgumentException) {
        count += 1
    }
    try {
        strb1.appendFromUtf8(b4)
    } catch (e: IllegalArgumentException) {
        count += 1
    }
    try {
        strb1.appendFromUtf8(b5)
    } catch (e: IllegalArgumentException) {
        count += 1
    }
    try {
        strb1.appendFromUtf8(b6)
    } catch (e: IllegalArgumentException) {
        count += 1
    }
    try {
        strb1.appendFromUtf8(b7)
    } catch (e: IllegalArgumentException) {
        count += 1
    }
    try {
        strb1.appendFromUtf8(b8)
    } catch (e: IllegalArgumentException) {
        count += 1
    }

    try {
        strb1.appendFromUtf8(c1)
    } catch (e: IllegalArgumentException) {
        count += 1
    }
    try {
        strb1.appendFromUtf8(c2)
    } catch (e: IllegalArgumentException) {
        count += 1
    }
    try {
        strb1.appendFromUtf8(c3)
    } catch (e: IllegalArgumentException) {
        count += 1
    }

    if (count == 11 && sum == 2) {
        return 0
    } else {
        return 1
    }
}
