
// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output > %n.txt
// EXEC: %diff %n.expect %n.txt

internal import std.ast.*

main(): Int64 {
    let input1 = quote(
        type Point<T> = Float64
    )
    let typeDecl = parseDecl(input1)
    if (!(typeDecl is TypeAliasDecl)) {
        return 1
    }
    let decl = (typeDecl as TypeAliasDecl).getOrThrow()
    if (decl.keyword.value != "type" || decl.identifier.value != "Point") {
        return 2
    }
    var ty = match (decl.aliasType as PrimitiveType) {
        case Some(v) => v
        case None => throw Exception()
    }
    if (ty.keyword.value != "Float64") {
        return 3
    }

    let generic = decl.genericParam
    let typeParams = generic.parameters
    if (typeParams.size != 1) {
        return 4
    }
    if (typeParams[0].value != "T") {
        return 5
    }
    let anno = decl.annotations
    if (anno.size != 0) {
        return 6
    }
    decl.dump()
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
