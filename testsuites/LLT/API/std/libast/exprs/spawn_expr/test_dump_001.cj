// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output > %n.txt
// EXEC: %diff %n.expect %n.txt

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: RefExpr) {
        ident.add(curNode.identifier.value)
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        spawn (Main) {
            mtx.lock()
            count += 1
            println("CangjieFunc: spawn (Main) ${i}, tid = ${gettid()}")
            unsafe { pthread_self() }
            mtx.unlock()
        }
    )
    let re = match (parseExpr(input) as SpawnExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, re.toTokens())
    if (!flag) {
        return 1
    }
    re.dump()
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
