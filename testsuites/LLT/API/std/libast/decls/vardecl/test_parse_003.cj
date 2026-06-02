// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
        var a: b.c<Int64, String>
    )
    let varDecl = (parseDecl(input) as VarDecl).getOrThrow()
    let output = quote($varDecl)
    let flag = compareTokens(input, output)
    output.dump()
    if (!flag) {
        return 1
    }
    let ty = varDecl.declType
    if (!(ty is QualifiedType)) {
        return 2
    }
    let qualifiedType = (ty as QualifiedType).getOrThrow()
    if (!(qualifiedType.baseType is RefType)) {
        return 3
    }
    if (qualifiedType.identifier.value != "c") {
        return 4
    }
    if (qualifiedType.typeArguments.isEmpty()) {
        return 5
    }
    let typeArguments = qualifiedType.typeArguments
    if (typeArguments[0].toTokens()[0].value != "Int64" || typeArguments[1].toTokens()[0].value != "String") {
        return 6
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
