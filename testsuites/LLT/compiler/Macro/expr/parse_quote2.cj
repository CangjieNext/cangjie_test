// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main() {
    var a = 2
    var b = quote(quote(1+$(a)))
    var c = parseExpr(b)
    if (!(c is QuoteExpr)) {
        return 1
    }
    var d = (c as QuoteExpr).getOrThrow()
    var res = match (d) {
        case x: QuoteExpr => 0
        case _ => 2
    }
    return res
}
