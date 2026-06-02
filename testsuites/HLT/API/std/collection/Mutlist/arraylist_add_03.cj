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
    var array1: Array<Int64> = Array<Int64>(1, {x: Int64 => Int64(x)})
    var a: ArrayList<Int64> = ArrayList<Int64>(array1)
    a.add(10)
    a.add(101)
    a.add(89)
    a.add(22)
    a.add(33)
    a.add(44)
    if (a.toString() != "[0, 10, 101, 89, 22, 33, 44]") {
        return 1
    }
    return 0
}
