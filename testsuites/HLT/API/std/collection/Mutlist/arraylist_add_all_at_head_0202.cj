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
import std.collection.*

main() {
    var a: ArrayList<Float64> = ArrayList<Float64>()
    var b: ArrayList<Float64> = ArrayList<Float64>([7.5, 8.9])
    a.add(all: ArrayList<Float64>([1.3]), at: 0)
    b.add(all: ArrayList<Float64>([2.3, 3.1]), at: 0)
    if (a.toString() != "[1.300000]") {
        return 1
    }
    if (b.toString() != "[2.300000, 3.100000, 7.500000, 8.900000]") {
        return 2
    }
    return 0
}
