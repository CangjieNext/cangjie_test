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
    var arr1 = ["3.40E38", "-3.40E38", "3.39999E38", #"1.20000E20"#, "0x.2p4", "156245.852356", "${156245.852356}"]
    var arr2 = ArrayList<Float32>()
    var arr3 = ArrayList<Float32>(
        [Float32(3.40E38), Float32(-3.40E38), Float32(3.39999E38), Float32(1.20000E20), 2.000000, 156245.852356,
            156245.852356])
    for (i in arr1) {
        arr2.add(Float32.tryParse(i).getOrThrow())
    }
    for (i in 0..arr2.size) {
        if (arr2[i] - arr3[i] > 1e-15) {
            return 1
        }
    }
    return 0
}
