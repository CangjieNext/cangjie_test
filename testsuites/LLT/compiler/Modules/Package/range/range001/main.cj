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
    let arr1 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    let a = arr1[range1]
    let b = arr1[range2]
    let c = arr1[range3]
    let d = arr1[range4]
    let e = arr1[range5]

    let f = arr1[0..3]
    var res = a[2] + b[1] + c[7] + d[5] + e[2] + f[1]

    if (res == 20) {
        return 0
    }
    return 1
}
