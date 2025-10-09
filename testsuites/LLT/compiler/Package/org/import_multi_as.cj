// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// LEVEL 0

// DEPENDENCE: import.pkg.cj importtwopkgs_withsamename_difforg.pkg.cj
// EXEC: %compiler import.pkg.cj %compile_lib_opt -o %n.%lib_extension
// EXEC: %compiler importtwopkgs_withsamename_difforg.pkg.cj %compile_lib_opt
// EXEC: %compiler %f %n.%lib_extension libm@b.%lib_extension -o %output
// RUN-EXEC-1: %run %run_opt %output %run_args

package a::c
import a::b
import m::b as mb

main() {
    b.foo() - mb.foo()
}
