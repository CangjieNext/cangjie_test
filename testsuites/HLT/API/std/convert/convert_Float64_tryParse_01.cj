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
    var arr1 = ["1.79E308", "1.78999E308", "-1.78999E308", "-1.79E308", "6.5504e4", #"3.9e-100"#, "0x.2p4",
        "156245.852356", "${156245.852356}"]
    var arr2 = ArrayList<Float64>()
    var arr3 = ArrayList<Float64>(
        [Float64(1.79E308), Float64(1.78999E308), Float64(-1.78999E308), Float64(-1.79E308), Float64(6.5504e4),
            Float64(3.9e-100), Float64(0x.2p4), Float64(156245.852356), Float64(156245.852356)])
    for (i in arr1) {
        arr2.add(Float64.tryParse(i).getOrThrow())
    }
    for (i in 0..arr2.size) {
        if (arr2[i] - arr3[i] > 1e-15) {
            return 1
        }
    }
    return 0
}
