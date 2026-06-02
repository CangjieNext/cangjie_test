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

import std.convert.*
import std.collection.*

main(): Int64 {
    var arr1 = ["-9223372036854775808", "9223372036854775807", #"0"#, "0B0010", "0b0010", "0o0030", "0O0030", "0X0030",
        "0x0030"]
    var arr2 = ArrayList<Int64>()
    var arr3 = ArrayList<Int64>([-9223372036854775808, 9223372036854775807, 0, 2, 2, 24, 24, 48, 48])
    for (i in arr1) {
        arr2.add(Int64.parse(i))
    }
    if (arr2 != arr3) {
        return 1
    }
    return 0
}
