/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: pkgs044001a pkgs044001b pkgs044001c pkgs044001d pkgs044001e pkgs044001f
// EXEC: %compiler %cmp_opt %compile_lib_opt pkgs044001a/pkgs044001a.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkgs044001b/pkgs044001b.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkgs044001c/pkgs044001c.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkgs044001d/pkgs044001d.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkgs044001e/pkgs044001e.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkgs044001f/pkgs044001f.cj
// EXEC: %compiler %cmp_opt %f libpkgs044001f.%middle libpkgs044001e.%middle libpkgs044001d.%middle libpkgs044001c.%middle libpkgs044001b.%middle libpkgs044001a.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkgs044001f

main(): Int64 {
    let a = pkgs044001f.six
    if (a != 6) {
        return 6
    }
    return 0
}
