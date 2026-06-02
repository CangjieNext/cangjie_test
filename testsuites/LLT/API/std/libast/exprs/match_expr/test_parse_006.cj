// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

class MyVisitor <: Visitor {
    public override func visit(curNode: Node) {
        println("")
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
         match(oneYear) {
            case Year(y) => y * 365 * 24
            case Month(y, m) => y * 365 * 24 + m * 30 * 24
            case Day(y, m, d) => foo(y,m,d)
            case _ => 42
        }
    )

    let matchExpr = (parseExpr(input) as MatchExpr).getOrThrow()
    let output = quote($matchExpr)

    let flag = compareTokens(input, output)
    if (!flag) {
        return 1
    }

    let matchCases = matchExpr.matchCases
    if (matchCases.size != 4) {
        return 2;
    }

    if (matchCases[1].patterns.size != 1 || !(matchCases[1].patterns[0] is EnumPattern)) { // Month(y,m)
        return 3;
    }
    let enumPat = (matchCases[1].patterns[0] as EnumPattern).getOrThrow()
    enumPat.traverse(myVisitor)
    let ref = (enumPat.constructor as RefExpr).getOrThrow().identifier
    if (ref.value != "Month") {
        return 4
    }
    let patterns = enumPat.patterns
    if (patterns.size != 2) {
        return 5
    }
    if (!(patterns[0] is VarOrEnumPattern)) {
        return 6
    }
    let varOrEnumPattern = (patterns[0] as VarOrEnumPattern).getOrThrow()
    varOrEnumPattern.traverse(myVisitor)
    let v = varOrEnumPattern.identifier
    if (v.value != "y") {
        return 7
    }
    if ((matchCases[1].patterns[0] is ConstPattern)) {
        return 8
    }
    if ((matchCases[1].patterns[0] is WildcardPattern)) {
        return 9
    }
    if ((matchCases[1].patterns[0] is VarPattern)) {
        return 10
    }
    if ((matchCases[1].patterns[0] is ExceptTypePattern)) {
        return 11
    }
    if ((matchCases[1].patterns[0] is TypePattern)) {
        return 12
    }
    if ((matchCases[1].patterns[0] is TuplePattern)) {
        return 13
    }
    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
