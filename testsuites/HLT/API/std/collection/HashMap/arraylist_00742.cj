/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import std.collection.*

main(): Int64 {
    var a: Array<HashMap<Int64, Int64>> = [HashMap<Int64, Int64>([(1, 1)])]
    var b: ArrayList<HashMap<Int64, Int64>> = ArrayList<HashMap<Int64, Int64>>(a)
    return b.size - 1
}
