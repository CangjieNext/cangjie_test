// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package tmp_test
import lib2.*

// DEPENDENCE: lib2.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full lib2.cj -o lib2.bc
// EXEC-PIPE-0: %compiler --lto-keep-pkg-visibility="lib2"  %cmp_opt --lto=full %f lib2.bc 2>&1 | compare %f

main(): Int64 {
    return 0
}

// ASSERT: scan --lto-keep-pkg-visibility only takes effect when outputting a dylib