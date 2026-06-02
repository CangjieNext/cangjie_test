//EXEC:%compiler %cmp_opt_chir2hlir %f -o %output
//EXEC: %run %run_opt %output
internal import std.ast.*

main(): Int64 {
    let input = quote(
        let (a, b, c) : (Int64,Int32,Int16) = (3, 4, 5)
    )
    let decl = parseDecl(input)
    let varWithPatternDecl = (decl as VarDecl).getOrThrow()
    if (!(decl is VarDecl)) {
        return 1
    }
    let anno = varWithPatternDecl.annotations
    if (anno.size != 0) {
        return -1
    }
    let output = quote($varWithPatternDecl)
    let flag = compareTokens(input, output)
    if (!flag) {
        return 1
    }
    let ty = varWithPatternDecl.declType
    if (!(ty is TupleType)) {
        return 2
    }
    let tupleType = (ty as TupleType).getOrThrow()
    let fields = tupleType.types
    if (fields[0].toTokens()[0].value != "Int64" || fields[1].toTokens()[0].value != "Int32" ||
        fields[2].toTokens()[0].value != "Int16") {
        return 3
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
