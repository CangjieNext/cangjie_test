// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../../external_import_in_module_compile
// EXEC: %compiler %pkg_opt ./external_import_in_module_compile/src/pkg1 -o libpkg1.%middle %compile_lib_opt
// EXEC: %compiler %pkg_opt ./external_import_in_module_compile/src/pkg2 -o libpkg2.%middle %compile_lib_opt
// EXEC: %compiler %pkg_opt ./external_import_in_module_compile/src libpkg1.%middle libpkg2.%middle -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump

internal import pkg2.A

main() {
    let a = A()
    println(a)
}
