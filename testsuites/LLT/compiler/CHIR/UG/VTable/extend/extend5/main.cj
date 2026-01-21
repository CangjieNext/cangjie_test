// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: pkg1.cj pkg2.cj pkg3.cj
// EXEC: %compiler %cmp_opt --link-options=--no-undefined %compile_shared_lib_opt pkg1.cj -o libpkg1.%dylib_suffix
// EXEC: %compiler %cmp_opt --link-options=--no-undefined %compile_shared_lib_opt pkg2.cj -L . -lpkg1 -o libpkg2.%dylib_suffix
// EXEC: %compiler %cmp_opt --link-options=--no-undefined %compile_shared_lib_opt pkg3.cj -L . -lpkg1 -lpkg2 -o libpkg3.%dylib_suffix
// EXEC: %compiler %cmp_opt %f -L . -lpkg3 -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan I::foo

import test3.*

main() {
    printB()
    0
}