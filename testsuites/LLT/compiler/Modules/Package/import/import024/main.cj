// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./pkgs
// EXEC: %compiler %cmp_opt %compile_lib_opt -p pkgs -o libpkgs.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f libpkgs.%middle -o %output 2>&1 | compare %f
// ASSERT: scan-4 error: package name cannot be referred independently

import pkgs as xpkg

func run(): Int64 {
    xpkg
}

main(): Int64 {
    if (xpkg) {
        run()
    }
    while (xpkg) {
        run()
    }
    match (xpkg) {
        case _ => run()
    }
    0
}
