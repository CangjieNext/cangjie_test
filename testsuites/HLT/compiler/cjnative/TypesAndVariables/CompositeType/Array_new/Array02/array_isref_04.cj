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

main() {
    let al: ArrayList<Int64> = ArrayList<Int64>([1, 2, 3, 4, 5].toArray())
    var arr: Array<Int64> = al.toArray()
    var b = arr
    b[0] = 100
    return arr[0] - 100
}
