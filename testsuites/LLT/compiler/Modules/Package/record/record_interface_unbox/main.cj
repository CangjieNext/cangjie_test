// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg pkg2
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg/pkg.cj -o pkg/pkg.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg/pkg.%middle pkg2/pkg.cj --import-path pkg -o pkg2/pkg.%middle
// EXEC: %compiler %cmp_opt pkg/pkg.%middle pkg2/pkg.%middle %n.cj --import-path pkg --import-path pkg2 -o %output
// EXEC: %run %run_opt %output %run_args

import pkg.*
import pkg
import pkg2.*
import pkg2

main() {
    let x = Foo(a: 100)
    let x2 = Foo(a: -1)
    if (pkg.f(x) == 100 && pkg2.f(x2) == -1) {
        return 0
    }
    return 1
}
