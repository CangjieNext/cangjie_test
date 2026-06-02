// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg/pkg.cj -o pkg/pkg.%middle
// EXEC: %compiler %cmp_opt pkg/pkg.%middle %n.cj --import-path pkg -o %output
// EXEC: %run %run_opt %output %run_args

internal import pkg.*

main() {
    var a = 0
    for (i in range1) {
        a = a + i
    }

    var b = 0
    for (i in range2) {
        b = b + i
    }

    var c = 0
    for (i in 0..10) {
        c = c + i
    } 

    var res = a + b + c

    if (res == 131) {
        return 0
    }
    return 1
}
