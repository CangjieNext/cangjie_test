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

main(): Int64 {
    var a: Int64 = -9223372036854775808
    var b: Int64 = 0
    //  var c:Int64 = -18446744073709551616
    var d: Int64 = 0
    var e: Int64 = -4611686018427387904
    //  }
    d = a >> 1
    if (d != e) {
        return 1
    }
    return 0
}
