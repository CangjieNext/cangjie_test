// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0

// DEPENDENCE: ../src
// EXEC: %compiler %pkg_opt ./src/pkgD -o libpkgD.%middle %compile_lib_opt
// EXEC: %compiler %pkg_opt ./src/pkgB -o libpkgB.%middle %compile_lib_opt
// EXEC-PIPE-1: %compiler %pkg_opt %noColor src libpkgB.%middle libpkgD.%middle %diag_json 2>&1 | compare %f
internal import pkgB.ff as dd

let c = pkgBdddd
let cc = ff(1)
let ccc = dd(1)
// ASSERT: scan sema_undeclared_identifier
// ASSERT: scan sema_missing_entry
