/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: pkg c_ffi.c

// build c library.
// (host_mac) EXEC: %clang %clang_opt c_ffi.c -o libc_ffi.%test_suffix
// (host_linux) EXEC: %clang %clang_opt c_ffi.c -o libc_ffi.%test_suffix
// (host_win) EXEC: %clang %clang_opt c_ffi.c -o libc_ffi.%test_suffix

// build pkg library, linking c library.
// it would succeed for host_mac target_android
// (host_mac & target_android) EXEC: %compiler %cmp_opt %compile_dylib_opt -L. -lc_ffi pkg/pkg.cj -o libpkg.%test_suffix
// (host_linux & target_android) EXEC: %compiler %cmp_opt %compile_dylib_opt -L. -lc_ffi pkg/pkg.cj -o libpkg.%test_suffix

// it would fail for host_mac target_mac
// (host_mac & target_mac) EXEC-PIPE-1: %compiler %cmp_opt %compile_dylib_opt -L. -lc_ffi pkg/pkg.cj -o libpkg.%test_suffix 2>&1 | compare %f
// (host_mac & target_mac) ASSERT: scan undefined symbol: _testfunc

// (host_linux & target_linux) EXEC: %compiler %cmp_opt %compile_dylib_opt -L. -lc_ffi pkg/pkg.cj -o libpkg.%test_suffix

// build main executable, linking both c library & pkg library.
// it would fail for host_mac target_android.
// (host_mac & target_android) EXEC-PIPE-1: %compiler %cmp_opt -L. -lc_ffi -lpkg %f -o %output --dy-std 2>&1 | compare %f
// (host_linux & target_linux) EXEC-PIPE-1: %compiler %cmp_opt -L. -lc_ffi -lpkg %f -o %output --dy-std 2>&1 | compare %f
// (host_linux & target_linux) ASSERT: scan undefined symbol: _testfunc

// (host_mac & target_android) ASSERT: scan undefined reference due to --no-allow-shlib-undefined: testfunc
// ASSERT: regex-not no position error occurred

import pkg.*

unsafe main(): Int64 {
    var result: Int8 = newtestfunc(1, 2)
    if (result == 3) {
        print("pass\n")
    }
    return 0
}
