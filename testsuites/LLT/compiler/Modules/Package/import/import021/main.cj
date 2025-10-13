// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./pkgs
// EXEC: %compiler %cmp_opt %compile_lib_opt -p pkgs -o libpkgs.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f libpkgs.%middle -o %output 2>&1 | compare %f
// ASSERT: scan-3 error: package name cannot be referred independently

import pkgs as xpkg

var res = xpkg

func run(x: Int64): Int64 {
    if (res == 4) {
        return 0
    }
    return 1
}

func foo<T>(t: T) {}

main(): Int64 {
    run(xpkg)
    foo<Int64>(xpkg)
    return run(1)
}
