// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj pkg.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %compile_lib_opt pkg.cj -o libpkg.%lib_extension
// EXEC: %run_macro %compiler %cmp_opt %f libpkg.%lib_extension -o %output
// EXEC: %run %run_opt %output %run_args

import define.*
import pkg.*

@X
var a = 1

main() {
    a
    return 0
}
