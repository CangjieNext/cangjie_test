// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../src
// EXEC: %compiler %pkg_opt ./src/pkgB -o libpkgB.%middle %compile_lib_opt
// EXEC: %compiler %pkg_opt ./src/pkgA -o libpkgA.%middle %compile_lib_opt
// EXEC-PIPE-1: %compiler %noColor %pkg_opt src libpkgA.%middle libpkgB.%middle %diag_json 2>&1 | compare %f

internal import pkgA.{pkgAa, pkgBstruct}

let a = pkgBstruct(1, 1)
let c = pkgBstruct(1, 1)
let ccc = pkgB

main() {}
// ASSERT: scan sema_undeclared_identifier
