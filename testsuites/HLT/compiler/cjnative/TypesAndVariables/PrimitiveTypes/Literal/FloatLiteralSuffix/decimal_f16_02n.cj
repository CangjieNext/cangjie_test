/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*

main(): Int64 {
    var b: Float32 = 0.000000000000000000000000000000000000000000000000000001
    print(b.format("e"))
    // var c = 65600f16
    // }

    var a = .00000002f16
    if (a.format("e") != "0.000000e+00") {
        return 1
    }
    return 0
}
