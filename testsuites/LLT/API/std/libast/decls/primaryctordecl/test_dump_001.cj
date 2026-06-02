// DEPENDENCE: %n.expect
// EXEC: %compiler %coverage_opt %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output > %n.txt
// EXEC: %diff %n.expect %n.txt

internal import std.ast.*

internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: ClassDecl) {
        ident.add(curNode.identifier.value)
        breakTraverse()
    }
    public override func visit(curNode: VarDecl) {
        ident.add(curNode.identifier.value)
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        @When[os == "Linux"]
        @C
        private const Rectangle(let width: Int64, let height: Int64) {
            this.width = 10
            this.height = 10
        }
    )
    let primaryCtor = match (parseDecl(input, astKind: "PrimaryCtorDecl") as PrimaryCtorDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    primaryCtor.traverse(myVisitor)

    // test annotations
    let annotations = primaryCtor.annotations
    if (annotations.size != 2) {
        return 1
    }
    if (annotations[0].identifier.value != "When") {
        return 2
    }
    if (!compareTokens(annotations[0].condition.toTokens(), quote(os == "Linux"))) {
        return 3
    }
    if (annotations[1].identifier.value != "C") {
        return 4
    }

    // test modifiers
    let modifiers = primaryCtor.modifiers
    if (modifiers.size != 2) {
        return 5
    }
    if (modifiers[0].keyword.value != "private" || modifiers[1].keyword.value != "const") {
        return 6
    }

    let output = quote($primaryCtor)
    let flag = compareTokens(input, output) // libast offers compareTokens
    if (!flag) {
        return 7
    }

    if (myVisitor.ident.size != 0) {
        return 8
    }
    let params = primaryCtor.funcParams
    if (params.size != 2) {
        return 9
    }
    primaryCtor.dump()

    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
