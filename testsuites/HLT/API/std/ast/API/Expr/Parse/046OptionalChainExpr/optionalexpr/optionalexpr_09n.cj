/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// (!(target_ios | target_ios_simulator)) ASSERT: regex error.*expected expression after \'\', found \'\.\'
// (target_ios | target_ios_simulator) ASSERT: scan ParseASTException

import std.ast.*

let opTokens = quote(a?.b??.c)
let opExpr = parseExpr(opTokens)

main(): Int64 {
    return 0
}
