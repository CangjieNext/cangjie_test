// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*
import std.collection.*

main() {
    let classDecl = ClassDecl(quote(class School <T> {}))
    let constraint = GenericConstraint()
    constraint.keyword = Token(TokenKind.WHERE)
    constraint.typeArgument = RefType(classDecl.genericParam.parameters)
    constraint.upperBound = Token(TokenKind.UPPERBOUND)
    constraint.upperBounds = ArrayList(1) {
        _ =>
        let upperBounds = RefType()
        upperBounds.lAngle = quote(<)[0]
        upperBounds.rAngle = quote(>)[0]
        upperBounds.identifier = Token(TokenKind.IDENTIFIER, "Serializable")
        upperBounds.typeArguments = ArrayList(1) {
            _ => RefType(classDecl.genericParam.parameters)
        }
        upperBounds
    }
    classDecl.genericConstraint.add(constraint)
    println(classDecl.toTokens())
}

/* SCAN-IN
class School < T > where T <: Serializable < T > {
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
