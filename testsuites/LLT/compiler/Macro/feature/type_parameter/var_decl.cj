// DEPENDENCE: var_decl_macro.cj
// EXEC: %compiler %cmp_macro var_decl_macro.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

import expr_macro.*

main(): Unit {
    @M(let a:(p1: Int64, p2: Int64) = (1, 2))
}

// ASSERT: scan description: identifier, token_id: 137, token_literal_value: p1, fileID: 1, line: 9, column: 15
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: p2, fileID: 1, line: 9, column: 26

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
