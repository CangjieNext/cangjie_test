// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output > %n.txt
// EXEC: %diff %n.expect %n.txt

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: RefExpr) {
        if (curNode.identifier.value == "mutex") {
            curNode.identifier = Token(TokenKind.IDENTIFIER, "mutex1")
        }
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        synchronized (mutex) {
            if (endIndex == 0) {
                if (!readFromConsole()) {
                    return Option<Rune>.None
                }
            }
            let result: Option<Rune> = this.getRune()
            buffer = buffer.slice(1, buffer.size - 1)
            endIndex -= 1
            return result
        }
    )
    let expr = match (parseExpr(input) as SynchronizedExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, expr.toTokens())
    if (!flag) {
        return 1
    }
    expr.traverse(myVisitor)
    if ((expr.structuredMutex as RefExpr).getOrThrow().identifier.value != "mutex1") {
        return 2
    }
    expr.dump()
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
