/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: utils.cj
// EXEC: %compiler %cmp_opt %f utils.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan StructDecl
// ASSERT: scan GenericParam
// ASSERT: scan GenericConstraint
// ASSERT: scan PrimaryCtorDecl
// ASSERT: scan-6 RefType
// ASSERT: scan-2 VarDecl
// ASSERT: scan-4 Modifier
// ASSERT: scan-4 PrimitiveType
// ASSERT: scan-5 LitConstExpr
// ASSERT: scan Block
import std.ast.*

var res = 0

main() {
    let input = quote(
    struct Test<T> where T <: X{
        static let counter: Int64 = 3
        let name: String = "afdoaidfad"
        private Test(
        x: T,
        name: String, // regular parameter
        annotation!: String = "nnn", // regular parameter
        var width!: Int64 = 1, // member variable parameter with initial value
        private var length!: Int64, // member variable parameter
        private var height!: Int64 = 3 // member variable parameter
        ) {}
    }
    )
    let decl = parseDecl(input)
    let visitor = MyVisitor()
    decl.traverse(visitor)

    return 0
}
