// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package tmp_test

// LEVEL: 1
// DEPENDENCE: lib1.cj lib2.cj

// EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full lib2.cj -o lib2.bc
// EXEC-PIPE-1: %compiler --lto-keep-pkg-visibility="lib1"  %cmp_opt %compile_shared_lib_opt lib1.cj lib2.bc -o lib.so 2>&1 | compare %f

// ASSERT: scan --lto-keep-pkg-visibility only takes effect when lto mode is enabled