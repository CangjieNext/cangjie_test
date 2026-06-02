// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args
internal import std.ast.*

main(): Int64 {
    let code = """
        main() : Int64{
            return 0
        }
    """
    let mainTokens = cangjieLex(code)
    let decl = parseDecl(mainTokens)
    if (!(decl is MainDecl)) {
        return 1
    }
    let mainDecl = match (decl as MainDecl) {
        case Some(v) => v
        case None => throw Exception()
    }

    let anno = mainDecl.annotations
    if (anno.size != 0) {
        return 2
    }
    let ty = mainDecl.declType
    if (!(ty is PrimitiveType)) {
        return 3
    }
    let funcBody = mainDecl.block.nodes
    if (funcBody.size != 1) {
        return 4
    }
    if (mainDecl.lParen.kind == ILLEGAL) {
        return 5
    }
    if (mainDecl.rParen.kind == ILLEGAL) {
        return 6
    }
    if (mainDecl.colon.kind == ILLEGAL) {
        return 7
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
