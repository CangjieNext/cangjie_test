// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output

internal import std.ast.*

main() {
    let input = quote( class A{ ~init() { tmpCheck.SetIndex(index) } } } )
    let b = parseDecl(input)
    b.toTokens().dump()
    if (b.toTokens()[4].value != "~" || b.toTokens()[5].value != "init") {
        print(b.toTokens()[4].value)
        return 1
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
