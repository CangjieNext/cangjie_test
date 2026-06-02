// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
        public enum TimeUnit<T1> <: I1 where T1 <: A {
            Year
            | Month(T1)
            func time() {}
        }
    )
    let decl = parseDecl(input)
    let enumDecl = match (decl as EnumDecl) {
        case Some(v) => v
        case None => throw Exception()
    }

    let modifiers = enumDecl.modifiers
    if (modifiers.size != 1 || modifiers[0].keyword.value != "public") {
        return 1
    }
    if (enumDecl.keyword.value != "enum") {
        return 2
    }
    if (enumDecl.identifier.value != "TimeUnit") {
        return 3
    }
    if (enumDecl.superTypes.size != 1 && !(enumDecl.superTypes[0] is RefType)) {
        return 4
    }
    let constructors = enumDecl.constructors
    if (constructors.size != 2) {
        return 5
    }
    let members = enumDecl.decls
    if (members.size != 1 || !(members[0] is FuncDecl)) {
        return 6
    }
    let genericParam = enumDecl.genericParam
    if (genericParam.parameters.size != 1 && genericParam.parameters[0].value != "T1") {
        return 7
    }
    if (!(decl is EnumDecl)) {
        return 8
    }
    let anno = enumDecl.annotations
    if (anno.size != 0) {
        return 9
    }
    if (enumDecl.ellipsis.kind != ILLEGAL) {
        return 10
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
