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
    var count = 0
    let a = "\u{00}".toArray()
    if (a == [0] && a is Array<UInt8>) {
        count++
    }

    var b = "\u{10}".toArray()
    if (b == [16] && b is Array<UInt8>) {
        count++
    }

    let c = [UInt8(UInt32(r'\u{ff}'))]
    if (c == [255] && c is Array<UInt8>) {
        count++
    }

    return count - 3
}
