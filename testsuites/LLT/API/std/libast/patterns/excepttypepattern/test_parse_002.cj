// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*
import std.collection.*

main(): Int64 {
    let pattern = ExceptTypePattern()
    pattern.pattern = VarPattern(quote(e)[0])
    pattern.colon = Token(COLON)
    pattern.types = ArrayList<TypeNode>([RefType(quote(Exception))])
    println(pattern.toTokens())

    return 0
}

/* SCAN-IN
e: Exception
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
