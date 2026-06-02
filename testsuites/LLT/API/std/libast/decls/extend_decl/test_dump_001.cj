// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output > %n.txt
// EXEC: %diff %n.expect %n.txt

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: FuncDecl) {
        ident.add(curNode.identifier.value)
    }

    public override func visit(curNode: RefType) {
        ident.add(curNode.identifier.value)
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        extend Foo <: I1 & I2 & I3 {
            public func f1(): Unit {}
            public func f2(): Unit {}
            public func f3(): Unit {}
        }
    )
    let decl = parseDecl(input)
    if (!(decl is ExtendDecl)) {
        return 1
    }
    let extendDecl = match (decl as ExtendDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    extendDecl.traverse(myVisitor)
    let kw = extendDecl.keyword
    if (kw.value != "extend") {
        return 2
    }
    let ty = extendDecl.extendType
    if (ty is PrimitiveType) {
        return 3
    }
    let interf = extendDecl.superTypes
    if (interf.size != 3) {
        return 4
    }
    if (interf[0] is PrimitiveType) {
        return 5
    }
    if (extendDecl.body.decls.size != 3) {
        return 6
    }
    let output = quote($extendDecl)
    let flag = compareTokens(input, output) // libast offers compareTokens
    if (!flag) {
        return 7
    }
    if (myVisitor.ident.size != 7) {
        return 8
    }
    extendDecl.extendType = RefType(quote(Bar))
    extendDecl.dump()
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
