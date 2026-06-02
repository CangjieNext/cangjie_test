
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

import std.ast.*
import std.collection.*

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

main() {
    let input2 = quote(
        @aaa
        public func test(){
            print(1)
        }
    )
    let decl = (parseDecl(input2) as MacroExpandDecl).getOrThrow()
    let a = decl.macroInputs[0]
    if (a.value != "public") {
        return 1
    }

    decl.traverse(myVisitor)
    if (myVisitor.ident.size != 1) {
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
