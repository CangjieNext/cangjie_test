// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg
// EXEC: %compiler %pkg_opt pkg %compile_lib_opt -o libpkg.%middle
// EXEC: %compiler %pkg_opt pkg/a %compile_lib_opt -o libpkg.a.%middle
// EXEC: %compiler %cmp_opt libpkg.%middle main.cj -o %main
// EXEC-0: %run %run_opt %main

import pkg.A

main() {
    A()
    0
}
