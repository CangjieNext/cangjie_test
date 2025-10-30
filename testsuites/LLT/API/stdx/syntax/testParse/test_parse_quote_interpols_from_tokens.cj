// EXEC: %compiler %import-cangjie-stdx %cmp_opt_chir2hlir %f -o %output
// EXEC: %set_stdx_path %run %run_opt %output %run_args 2>&1 | compare %f

import stdx.syntax.*
import std.collection.ArrayList

main() {
    let expr = (parseTokens(quote(quote    (\(\)))).node.getOrThrow() as QuoteExpr).getOrThrow()
    match(expr.tokensOrRefExpr[0]) {
        case TokenPart(v) => println(v.toString())
        case _ => return 1
    }
    println(expr.toString())

    let expr_0 = (parseTokens(quote(quote   (\$a))).node.getOrThrow() as QuoteExpr).getOrThrow()
    println(expr_0.toString())

    let expr_1 = (parseTokens(quote(VArray<Int64, \$5>([0, 3, 4]))).node.getOrThrow() as VArrayExpr).getOrThrow()
    println(expr_1.toString())
    let vArrayTy = (expr_1.vArrayType as VArrayType).getOrThrow()
    let elemType = (vArrayTy.elementType as AtomicType).getOrThrow()
    match(elemType.kind) {
        case Int64Type => ()
        case _ => return 2
    }

    let node = parseTokens(quote([    1,    2,    3    ]), refreshPos: false)
    let expr_2 = (node.node.getOrThrow() as ArrayLiteral).getOrThrow()
    println(expr_2.toString())

    var expr_4: QuoteExpr = (parseTokens(quote(quote(\$(quote(\$t))))).node.getOrThrow() as QuoteExpr).getOrThrow()
    println(expr_4.toString())
    println(expr_4.tokensOrRefExpr.size)
    return 0
}

/* SCAN-IN
quote($(quote($t)))
 */
/* SCAN-IN
quote(())
 */
/* SCAN-IN
quote($a)
 */
/* SCAN-IN
[    1,    2,    3    ]
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */