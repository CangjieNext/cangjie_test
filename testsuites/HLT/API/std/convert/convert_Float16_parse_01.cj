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
    var arr1 = ["5.9604645e-8", "5.9604645e-7", #"6.103515625e-5"#, "6.0975552e-5", "6.0975552e-1", "6.5504e4", "0x.2p4",
        "15625.852356", "${15625.852356}", "6.097552e3"]
    var arr2 = ArrayList<Float16>()
    var arr3 = ArrayList<Float16>(
        [Float16(5.9604645e-8), Float16(5.9604645e-7), Float16(6.103515625e-5), Float16(6.0975552e-5),
            Float16(6.0975552e-1), 65504.000000, 2.000000, 15625.852356, 15625.852356, Float16(6.097552e3)])
    for (i in arr1) {
        arr2.add(Float16.parse(i))
    }
    for (i in 0..arr2.size) {
        if (arr2[i] - arr3[i] > 1e-15) {
            return 1
        }
    }
    return 0
}
