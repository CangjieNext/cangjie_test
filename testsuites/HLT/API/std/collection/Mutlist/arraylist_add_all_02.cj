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
    var a: ArrayList<UInt32> = ArrayList<UInt32>()
    var array1: Array<UInt32> = Array<UInt32>(3, {x: Int64 => UInt32(x)})
    var b: ArrayList<UInt32> = ArrayList<UInt32>(array1)
    var array2: Array<UInt32> = [100, 200]
    a.add(all: array2)
    b.add(all: array2)
    if (a.toString() != "[100, 200]") {
        return 1
    }
    if (b.toString() != "[0, 1, 2, 100, 200]") {
        return 2
    }
    return 0
}
