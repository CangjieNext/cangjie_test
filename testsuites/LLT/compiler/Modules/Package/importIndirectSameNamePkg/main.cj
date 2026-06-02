// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg.cj pkg2.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg2.cj -o pkg2.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg.cj -o pkg.%middle
// ERRCHECK: %compiler %cmp_opt pkg.%middle pkg2.%middle %n.cj -o %output

package pkg2

internal import pkg.*

// Was segv, should report error
main() {}

/* SCAN
error: failed to load dependent package 'pkg2' for package 'pkg', which have same package name with source package
1 error generated, 1 error printed.
*/
