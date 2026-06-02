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

var iter1 = "仓颉".runes()
var iter2 = "Cangjie".iterator()

main(): Int64 {
    var c1: Rune = r'a'
    var c2: Rune = r'b'
    for (i in iter1) {
        c1 = i
    }
    for (i in iter2) {
        c2 = Rune(UInt32(i))
    }

    if (c1 == r'颉' && c2 == r'e') {
        return 0
    }
    return 1
}
