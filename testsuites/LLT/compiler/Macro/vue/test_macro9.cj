// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: test_macro1.cj
// EXEC: %compiler %cmp_macro test_macro1.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import view.*

main(): Int64 {
    var a = 1
    let b = @callView5("${a}")
    if (b != "1") {
        return 1
    }
    0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
