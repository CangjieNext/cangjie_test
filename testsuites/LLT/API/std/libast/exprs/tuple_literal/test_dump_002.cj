/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

internal import std.ast.TupleLiteral
internal import std.collection.ArrayList

main() {
    let tp = TupleLiteral(quote((1, 2, 3)))
    tp.elements.size |> println
    tp.elements.clear()
    tp.elements.size |> println
    tp.toTokens() |> println
    tp.dump()
}

/* SCAN
3
0
()
TupleLiteral {
}
*/