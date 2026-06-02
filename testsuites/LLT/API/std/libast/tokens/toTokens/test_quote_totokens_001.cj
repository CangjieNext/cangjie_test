/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

import std.ast.*

main(){
    let b = (parseExpr(quote(quote(\$(a)))) as QuoteExpr).getOrThrow()
    println(b.toTokens().toString())
    return 0
}

/* SCAN-IN
quote($(a))
*/