/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: pkg c_ffi.c
// (!host_win) EXEC: %clang %clang_opt c_ffi.c -o libc_ffi.%test_suffix
// (!(host_win | host_mac)) EXEC: %compiler %cmp_opt --output-type=dylib -L. -lc_ffi pkg/pkg.cj -o libpkg.%test_suffix
// (!(host_win | host_mac)) EXEC-PIPE-1: %compiler %cmp_opt %f -L. -lc_ffi -lpkg -o %output --dy-std 2>&1 | compare %f
// (host_mac) EXEC-PIPE-1: %compiler %cmp_opt --output-type=dylib -L. -lc_ffi pkg/pkg.cj -o libpkg.%test_suffix 2>&1 | compare %f

// (!(host_win | host_mac)) ASSERT: scan undefined reference
// (host_mac) ASSERT: scan undefined symbol
// (!host_win) ASSERT: regex-not no position error occurred

import pkg.*

unsafe main(): Int64 {
    var result: Int8 = newtestfunc(1, 2)
    if (result == 3) {
        print("pass\n")
    }
    return 0
}
