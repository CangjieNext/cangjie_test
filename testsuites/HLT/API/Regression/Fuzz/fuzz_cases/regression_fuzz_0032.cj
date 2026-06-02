/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %overflow_wrapping %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 

import std.ast.*

main() {
    var strInitStmt: String = #"var text = "123""#
    var stmtTokens: Tokens = cangjieLex(strInitStmt)

    if (stmtTokens.toString().contains("var text = \"123\"")) {
        return 0
    }
    return 1
}
