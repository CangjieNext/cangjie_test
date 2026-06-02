// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
        extend Foo <: I1 & I2 {
            func f(): Unit {}
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
    let kw = extendDecl.keyword
    if (kw.value != "extend") {
        return 2
    }
    let ty = extendDecl.extendType
    if (ty is PrimitiveType) {
        return 3
    }
    let interf = extendDecl.superTypes
    if (interf.size != 2) {
        return 4
    }
    if (interf[0] is PrimitiveType) {
        return 5
    }
    if (extendDecl.body.decls.size != 1) {
        return 6
    }
    let edDecl = parseDecl(input)
    let output = quote($edDecl)
    output.dump()
    let flag = compareTokens(input, output) // libast offers compareTokens
    if (!flag) {
        return 7
    }
    let ands = extendDecl.superTypeBitAnds
    if (ands.size != 1) {
        return 8
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
