// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output > %n.txt
// EXEC: %diff %n.expect %n.txt

internal import std.ast.*

class MyVisitor <: Visitor {}

main() {
    let input = quote(
        main(){
            (a~>b)("hello")
        }
    )
    let node = parseDecl(input)
    node.traverse(MyVisitor())

    let decl = match (node as MainDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    if (decl.block.nodes.size != 1) {
        return 1
    }
    let callExpr = (decl.block.nodes[0] as CallExpr).getOrThrow()
    callExpr.dump()
    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
