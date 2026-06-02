/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (JS) EXEC: cp -r %stdpath .
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args
import std.collection.*

main() {
    var array1: Array<Int64> = Array<Int64>(3, {x: Int64 => Int64(x)})
    var arrayList1: ArrayList<Int64> = ArrayList<Int64>(array1)
    let a: Option<ArrayList<Int64>> = arrayList1
    let a1: ?ArrayList<Int64> = arrayList1
    let b: ?ArrayList<Int64> = None
    let b1: Option<ArrayList<Int64>> = None
    if (!(a == a1)) {
        return 1
    }
    if (!(b == b1)) {
        return 2
    }
    return 0
}
