// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ./pkg
// EXEC: %compiler %pkg_opt ./pkg -o libpkg.%middle %compile_lib_opt
// EXEC: %compiler %f libpkg.%middle -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

internal import pkg.*

main() {
    unsafe { LibC.free(cstr1) }
    0
}
