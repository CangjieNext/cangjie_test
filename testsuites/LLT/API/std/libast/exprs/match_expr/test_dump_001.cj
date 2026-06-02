// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output > %n.txt
// EXEC: %diff %n.expect %n.txt

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: MatchCase) {
        breakTraverse()
    }
    public override func visit(curNode: RefExpr) {
        ident.add(curNode.identifier.value)
        println(curNode.identifier.value)
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        match(bodyType) {
            case Some(value) =>
                if (value == -1) {
                    response._bodySize = None
                    return ResponseBodyProviderUtilConnectionClose(this)
                }
                if (value == 0) {
                    readTimer.cancel()
                    return HttpEmptyBody.INSTANCE
                }
                response._bodySize = value
                return HttpNormalBodyProvider(this, value, readTimer)
            case None =>
                checkTrailerInHeader(response.headers, false)
                response._bodySize = None
                return HttpChunkedBodyProvider(this, response, readTimer)
        }
    )
    let expr = match (parseExpr(input) as MatchExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, expr.toTokens())
    if (!flag) {
        return 1
    }
    expr.traverse(myVisitor)
    if (myVisitor.ident.size != 1) {
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
