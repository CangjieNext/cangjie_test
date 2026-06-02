// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg.cj
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %enableO2 pkg.cj %compile_lib_opt -o test0.%middle
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableO2 test0.%middle %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE-0: %run %run_opt %output %run_args

import pkg.*

main() {
    let a: II<Int64> = A<Int64>()
    a.a()
}

// ASSERT: scan [Devirtualization] The function call to a at [16,5] was optimized.
// ASSERT: scan The Apply node in the line:21 and the column:9, was optimized by Function Inline
