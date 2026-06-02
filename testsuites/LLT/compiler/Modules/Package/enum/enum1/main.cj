// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg/pkg.cj -o pkg/pkg.%middle
// EXEC: %compiler %cmp_opt pkg/pkg.%middle %n.cj --import-path pkg  -o %output
// EXEC: %run %run_opt %output %run_args

internal import pkg.*

main(): Int64 {
    var u1 = Unit1.u1_5
    var ans1: Int32 = match (u1) {
        case u1_5 => 5
        case _ => 3
    }
    var u2 = u2_1110(10, 100, 1000)
    var ans2: Int32 = match (u2) {
        case u2_10(x) => x
        case u2_110(x, y) => x + y
        case u2_1110(x, y, z) => x + y + z
    }
    if (ans1 + ans2 == 1115) {
        return 0
    }
    return 1
}
