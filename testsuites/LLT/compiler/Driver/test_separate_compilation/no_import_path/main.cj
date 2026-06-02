// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./pkg
// DEPENDENCE: ./pkg_test
// EXEC: %mkdir build
// EXEC: %compiler %cmp_opt %pkg_opt -Woff=all pkg --mock=off %compile_lib_opt --output build/p1.%middle
// EXEC-PIPE-1: %compiler %cmp_opt -Woff=all -p pkg_test --test-only --mock=off -o %output 2>&1 | compare %f
// ASSERT: scan error: package 'pkg' is being compiled with --test-only option, but no dependency for production part of this package provided
