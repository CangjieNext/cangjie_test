// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./pkg
// DEPENDENCE: ./pkg_test
// EXEC: %mkdir build
// EXEC: %compiler %cmp_opt -p pkg -Woff=all --mock=off --export-for-test %compile_lib_opt --output p1.%middle
// EXEC: %compiler p1.%middle %cmp_opt -Woff=all -p pkg_test --test-only --mock=off -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args
