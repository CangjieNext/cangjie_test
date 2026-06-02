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
import std.sort.SortExtension

main(): Int64 {
    var a1 = ArrayList<Int8>([])
    var a2 = ArrayList<Int8>([])
    var a3 = ArrayList<Int8>([])
    a1.sortDescending()
    a2.sortDescending(stable: false)
    a3.sortDescending(stable: true)
    if (a1.size != 0 || a2.size != 0 || a3.size != 0) {
        return 1
    }
    return 0
}
