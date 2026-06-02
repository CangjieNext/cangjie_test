// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ./pkg1
// DEPENDENCE: ./pkg2
// EXEC: %compiler %pkg_opt ./pkg1 -o libpkg1.%middle %compile_lib_opt
// EXEC: %compiler %pkg_opt ./pkg2 -o libpkg2.%middle %compile_lib_opt
// EXEC: %compiler %f libpkg1.%middle libpkg2.%middle -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

internal import p1.I as I1
internal import p2.I as I2

main() {
    var optA = None<I1>
    var optB = None<I2>
    0
}
