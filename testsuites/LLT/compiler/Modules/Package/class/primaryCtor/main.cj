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
    return 1
}

main(): Int64 {
    if (D().z == 5 && C().x == r'z' && F(x: false).x == false
        && G(2).a == 2
        && G(2).b == 8
        && G(3, b: 6).b == 6
        && Date(length: 4).length == 4
        && Date().perimeter() == f()) {
        return 0
    }
    return 1
}
