/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: pkg c_ffi.c
// (target_ios | target_ios_simulator) EXEC: %clang %clang_opt c_ffi.c -o libc_ffi.o
// (!(target_ios | target_ios_simulator)) EXEC: %clang %clang_opt c_ffi.c -o libc_ffi.%test_suffix
// EXEC: %compiler %cmp_opt %pkg_compile pkg/pkg.cj -o libpkg.%test_suffix
// EXEC: %compiler %cmp_opt %f %pkg_link -o %output
// RUN-EXEC: %run %output %run_args

import pkg.*

unsafe main(): Int64 {
    var result: Int8 = newtestfunc(1, 2)
    if (result == 3) {
        return 0
    } else {
        return 1
    }
}
