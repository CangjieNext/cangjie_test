// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: pkg.cj
// EXEC: %compiler pkg.cj %compile_lib_opt %enableO2 -o libpkg.%middle
// EXEC: %compiler libpkg.%middle %enableO2 %f -o %output
// EXEC: %run %run_opt %output %run_args

import pkg.*

class CA <: III {}

main() {
    var x: III = CA()
    x.foo()
}
