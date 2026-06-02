// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: add_func_define.cj
// EXEC: %compiler %cmp_macro add_func_define.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

import define.*

@M1
func foo() {
    throw Exception("foo")
}

main() {
    foo()
    return
}

// the line number at the top of stacktrace should be 16, not 14

// ASSERT: regex at default::foo().*stacktrace_info.cj:16
