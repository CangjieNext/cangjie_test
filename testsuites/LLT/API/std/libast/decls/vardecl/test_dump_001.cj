// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output > %n.txt
// EXEC: %diff %n.expect %n.txt

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: VarDecl) {
        ident.add(curNode.identifier.value)
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        var a: b.c<Int64, String>
    )
    let varDecl = match (parseDecl(input) as VarDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    varDecl.traverse(myVisitor)
    let modifiers = varDecl.modifiers
    if (modifiers.size != 0) {
        return 1
    }
    let output = quote($varDecl)
    let flag = compareTokens(input, output) // libast offers compareTokens
    if (!flag) {
        return 3
    }
    if (myVisitor.ident.size != 1) {
        return 4
    }
    varDecl.dump()
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
