/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
import std.collection.*

main() {
    var a: ArrayList<Int64> = ArrayList<Int64>()
    var array1: Array<Int64> = Array<Int64>(1, {x: Int64 => Int64(x + 10)})
    var array2: Array<Int64> = Array<Int64>(4, {x: Int64 => Int64(x + 2)})
    var array3: Array<Int64> = Array<Int64>()
    a.add(all: array1)
    a.add(all: array3)
    a.add(all: array2)
    a.add(all: array1)
    a.add(all: array2)
    a.add(all: array1)
    a.add(all: array1)
    a.add(all: array3)
    println(a)
    if (a.toString() != "[10, 2, 3, 4, 5, 10, 2, 3, 4, 5, 10, 10]") {
        return 1
    }
    return 0
}
