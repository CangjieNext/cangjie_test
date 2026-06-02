// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args
internal import std.ast.*

main(): Int64 {
    let code = """
        main() {
            return 0
        }
    """
    let mainTokens = cangjieLex(code)
    let decl = parseDecl(mainTokens)
    if (decl is MacroDecl) {
        return 1
    }
    if (!(decl is MainDecl)) {
        return 2
    }
    let mainDecl = match (decl as MainDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    var err = false
    try {
        mainDecl.declType
    } catch (e: ASTException) {
        err = true
    }
    if (!err) {
        return 3
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
