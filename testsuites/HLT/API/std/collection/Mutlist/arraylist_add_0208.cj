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
    var array1: Array<Int64> = Array<Int64>(3, {x: Int64 => Int64(x)})
    var arrayList1: ArrayList<Int64> = ArrayList<Int64>(array1)
    var a: ArrayList<ArrayList<Int64>> = ArrayList<ArrayList<Int64>>([ArrayList<Int64>([10]), ArrayList<Int64>([100])])
    a.add(arrayList1)
    if (a.toString() != "[[10], [100], [0, 1, 2]]") {
        return 1
    }
    return 0
}
