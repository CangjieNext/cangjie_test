// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE:  pkga
// EXEC: %compiler %cmp_opt -p %compile_lib_opt pkga/pkgb/pkgc/pkgd/pkge/ -o pkga.pkgb.pkgc.pkgd.pkge.%middle
// EXEC: %compiler %cmp_opt %f pkga.pkgb.pkgc.pkgd.pkge.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

internal import pkga.pkgb.pkgc.pkgd.pkge.five as afive

var five: Int32 = 6

main(): Int64 {
    let e3 = afive
    if (e3 != 5) {
        return 1
    }
    return 0
}
