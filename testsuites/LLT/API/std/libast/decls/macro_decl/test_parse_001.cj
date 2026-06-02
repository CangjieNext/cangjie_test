// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args
internal import std.ast.*

class MyVisitor <: Visitor {
    public override func visit(curNode: Node) {}
}

let myVisitor = MyVisitor()

main(): Int64 {
    let code = """
        public macro X (input:Tokens) : Tokens{
            return input
        }
    """
    let macroTokens = cangjieLex(code)

    let macroDecl = (parseDecl(macroTokens) as MacroDecl).getOrThrow()
    macroDecl.traverse(myVisitor)
    // Test modifier.
    let modifiers = macroDecl.modifiers
    if (modifiers.size != 1) {
        return 1
    }
    if (modifiers[0].keyword.value != "public") {
        return 2
    }
    // Test identifier.
    if (macroDecl.identifier.value != "X") {
        return 3
    }
    // Test FuncParamList.
    let params = macroDecl.funcParams
    if (params.size != 1) {
        return 4
    }
    let param0 = params[0]
    if (param0.identifier.value != "input") {
        return 5
    }
    let ty = macroDecl.declType
    if (!(ty is RefType)) {
        return 6
    }
    let retTy = (ty as RefType).getOrThrow()
    if (retTy.identifier.value != "Tokens") {
        return 7
    }

    // Test FuncBody.
    let body = macroDecl.block.nodes
    if (body.size != 1) {
        return 8
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
