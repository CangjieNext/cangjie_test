// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg.cj
// EXEC: %compiler %cmp_opt pkg.cj %compile_lib_opt -o libpkg.%middle
// EXEC: %compiler %cmp_opt %f libpkg.%middle -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan false1

import pkg

main() {
    let a = pkg.A<Int64>()
    println("${a.f()()}${a.f(0)()}")
}
