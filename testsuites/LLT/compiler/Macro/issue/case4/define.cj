// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define

import std.ast.*

func checkPosValid(node: Node): Unit {
    if (node.beginPos.line == 0 && node.beginPos.column == 0 &&
        node.endPos.line == 0 && node.endPos.column == 0) {
        throw Exception("the position info of AST node is missing")
    }
}

class PosCheckVisitor <: Visitor {
    public override func visit(fp: FuncParam) {
        checkPosValid(fp)
    }

    public override func visit(b: Block) {
        checkPosValid(b)
    }

    public override func visit(mc: MatchCase) {
        checkPosValid(mc)
    }
}

public macro CheckPos(input: Tokens): Tokens {
    let decl = parseDecl(input)
    decl.traverse(PosCheckVisitor())
    return input
}
