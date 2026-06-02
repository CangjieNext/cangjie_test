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

func f(): Int32 {
    return 2
}

func f1(): Int32 {
    return 1
}

main(): Int64 {
    if (Date2().perimeter() == f()
        && Date4().perimeter() == f1()
        && Date4().length == 1
        && B().x == 3
        && B().ai == false
        && G().x == 6) {
        return 0
    }
    return 1
}
