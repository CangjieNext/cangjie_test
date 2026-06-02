// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main() {
    let input = quote(
        @testMacro(1)
    )
    let ret = (parseExpr(input) as MacroExpandExpr).getOrThrow()
    let output = quote($ret)
    let flag = compareTokens(input, output)
    input.dump()
    if (!flag) {
        return 1
    }
    let ident = ret.identifier
    if (ident.value != "testMacro") {
        return 2
    }
    let attr = ret.macroAttrs
    if (attr.size != 0) {
        return 3
    }
    let args = ret.macroInputs
    if (args[0].value != "1") {
        return 4
    }
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
