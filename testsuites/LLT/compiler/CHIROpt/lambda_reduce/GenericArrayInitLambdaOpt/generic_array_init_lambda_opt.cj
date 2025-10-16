// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./pkg.cj
// (not Windows) EXEC-PIPE-0: %compiler %debugCHIROpt %enableO2 pkg.cj %compile_lib_opt -o pkg.%middle 2>&1 | compare %f
// (not Windows) EXEC-PIPE-0: %compiler %enableO2 pkg.%middle %n.cj -o %output
// (not Windows) EXEC-PIPE-0: %run %run_opt %output %run_args
// (not Windows) ASSERT: scan The Apply node in the line:10 and the column:5, was optimized by functionInlineForLambda

import pkg.*

main() {
    var arr: Array<Int64> = Array<Int64>()
    arr = foo<Int64>(1)
}
