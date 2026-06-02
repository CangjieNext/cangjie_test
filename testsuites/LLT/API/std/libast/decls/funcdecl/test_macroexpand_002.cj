// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main() {
    let fnstr = """
    func fn(@A[1]a: collection.ArrayList<String>){

    }
    """
    let tokens = cangjieLex(fnstr)
    let decl = (parseDecl(tokens) as FuncDecl).getOrThrow()
    var tks = decl.toTokens()
    if (tks[4].value != "A") {
        return 1
    }
    if (tks[6].value != "1") {
        return 2
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
