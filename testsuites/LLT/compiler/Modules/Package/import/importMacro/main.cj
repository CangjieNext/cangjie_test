// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./pkgs
// EXEC: %compiler %cmp_opt %compile_lib_opt -p pkgs/pkgA -o libpkgs.pkgA.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt -p pkgs/pkgM/pkgM_a -o libpkgs.pkgM.a.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt -p pkgs/pkgM -o libpkgs.pkgM.%middle
// (CJNATIVE) EXEC-0: %compiler %cmp_opt libpkgs.pkgM.%middle libpkgs.pkgM.a.%middle libpkgs.pkgA.%middle %f -o %output
// (not CJNATIVE) EXEC-0: %compiler %cmp_opt libpkgs.pkgA.%middle libpkgs.pkgM.a.%middle libpkgs.pkgM.%middle %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkgs.pkgM.*

var a = A.getInstance()

main() {
    return 0
}
