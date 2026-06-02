// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt pkg -o .
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %diag_json %f 2>&1 | compare %f

internal import pkg.a
internal import pkg.b as a

main() {
    a
}

// ASSERT: scan sema_ambiguous_use
