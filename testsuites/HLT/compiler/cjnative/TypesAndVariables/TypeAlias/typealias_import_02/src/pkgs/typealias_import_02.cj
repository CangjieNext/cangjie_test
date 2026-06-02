/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: pkga.cj
// EXEC: %compiler %cmp_opt %f pkga.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package pkgs

type int1 = Int64

main(): Int64 {
    var i1: Int64 = 1
    let i2: int1 = 2
    let i3: Int32 = a
    var i4: int2 = 2
    var res1: int1 = i1 + i2
    var res2: int2 = i3 + i4
    if (res1 == 3 && res2 == 3) {
        return 0
    }
    return 1
}
