// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main() {
    let input = quote(
        @testMacro1.a
        func test() {

        }
    )
    let ret = (parseDecl(input) as MacroExpandDecl).getOrThrow()

    let output = quote($ret)
    let flag = compareTokens(input, output)
    input.dump()
    if (!flag) {
        return 1
    }
    let ident = ret.identifier
    if (ident.value != "a") {
        return 2
    }

    let args = ret.macroInputs
    if (args.size != 8) {
        return 4
    }

    let fullName = ret.fullIdentifier
    if (fullName.value != "testMacro1.a") {
        return 6
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
