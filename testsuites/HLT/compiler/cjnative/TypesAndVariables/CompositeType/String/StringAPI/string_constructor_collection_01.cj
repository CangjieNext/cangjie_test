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

import std.collection.*

main(): Int64 {
    var arr1: ArrayList<Rune> = ArrayList<Rune>([r'a', r'b', r'c', r'd', r'e'])
    var str3 = String(arr1)
    if (str3 != "abcde") {
        return 1
    }
    return 0
}
