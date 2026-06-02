/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args
import std.collection.*

main() {
    var array1: Array<Int64> = Array<Int64>(2, {x: Int64 => Int64(x)})
    let a: Option<ArrayList<Int64>> = ArrayList<Int64>(array1)
    let b: ?ArrayList<Int64> = None
    if (a.toString() != "Some([0, 1])") {
        return 1
    }
    if (b.toString() != "None") {
        return 2
    }
    return 0
}
