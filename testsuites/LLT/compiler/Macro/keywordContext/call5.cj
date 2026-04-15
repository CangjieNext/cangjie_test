// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan parse_expected_expression
// ASSERT: scan the error originates in the macro `public` (consider using `--debug-macro` for more info)

import open.*

main(): Int64 {
    var a: Int64 = @public[1+](2+3)
}

