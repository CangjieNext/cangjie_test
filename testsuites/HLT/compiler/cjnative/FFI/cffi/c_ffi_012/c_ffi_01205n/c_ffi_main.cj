/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: pkg cfg.json cfg-main.json c_ffi.c
// (!host_win) EXEC: %clang %clang_opt c_ffi.c -o libc_ffi.%test_suffix
// (!host_win) EXEC: %sed %sed_opt "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// (!host_win) EXEC: %sed %sed_opt "s!cangjieCFFI_path!%cstring_cjo!g" cfg-main.json
// (!(host_win | host_mac)) EXEC: %compiler %cmp_opt %pkg_compile pkg/pkg.cj -o libpkg.%test_suffix
// (!(host_win | host_mac)) ERRCHECK: %compiler %cmp_opt %f %pkg_link -o %output --dy-std
// (!(host_win | host_mac)) ASSERT: scan undefined reference
// (host_mac) ERRCHECK: %compiler %cmp_opt %pkg_compile pkg/pkg.cj -o libpkg.%test_suffix
// (host_mac) ASSERT: scan undefined symbol

import pkg.*

unsafe main(): Int64 {
    var result: Int8 = newtestfunc(1, 2)
    if (result == 3) {
        print("pass\n")
    }
    return 0
}
// (!host_win) ASSERT: regex-not no position error occurred
