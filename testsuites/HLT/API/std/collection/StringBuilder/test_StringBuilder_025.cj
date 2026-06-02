/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args

import std.math.*

unsafe main(): Int64 {
    var strb = StringBuilder([r'b', r' ', r'c', r'戸', r'E', r'@', r'。', r'a', r',', r'\''])
    var arr1: Array<UInt8> = [9, 32]
    strb.appendFromUtf8(Array<UInt8>())
    var strb1 = strb.appendFromUtf8(arr1)
    if (!(strb1.toString() == "()") || !(strb.toString() == "b c戸E@。a,'\t ")) {
        return 1
    }

    var arr2: Array<UInt8> = [230, 178, 157]
    var strb2 = strb.appendFromUtf8(arr2)
    if (!(strb2.toString() == "()") || !(strb.toString() == "b c戸E@。a,'\t 沝")) {
        return 2
    }

    var arr3: Array<UInt8> = [227, 128, 130, 32, 32, 32]
    var strb3 = strb.appendFromUtf8(arr3)
    strb.appendFromUtf8(Array<UInt8>())
    if (!(strb3.toString() == "()") || !(strb.toString() == "b c戸E@。a,'\t 沝。   ")) {
        return 3
    }

    return 0
}
