/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

internal import std.ast.ArrayLiteral
internal import std.collection.ArrayList

main() {
    let arrayLiteral = ArrayLiteral(quote([1, 2, 3]))
    arrayLiteral.elements.size |> println
    arrayLiteral.elements.clear()
    arrayLiteral.elements.size |> println
    arrayLiteral.toTokens() |> println
    arrayLiteral.dump()
}

/* SCAN
3
0
[]
ArrayLiteral {
}
*/