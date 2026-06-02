// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: test_macro_quote17.cj
// EXEC: %compiler %cmp_macro test_macro_quote17.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f

import view.*

main() {
    return @test2(1)
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
