
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
        public func foo(a: Int32, b: T, c!: Int32 = 42) : Int32 {
            if ( a > 100 ) {
                return 42
            }
            let d = a + c
            return d
        }
    )
    let fd = parseDecl(input) as FuncDecl
    var funcDecl = match (fd) {
        case Some(v) => v
        case None => throw Exception()
    }
    // Test identifier.
    if (funcDecl.identifier.value != "foo") {
        return -1
    }
    // Test return type.
    let ty = funcDecl.declType
    var flag = ty is PrimitiveType
    if (!flag) {
        return -1
    }
    // Test modifiers.
    let modifiers = funcDecl.modifiers
    if (modifiers.size != 1) {
        return -1
    }
    if (modifiers[0].keyword.value != "public") {
        return -1
    }
    // Test FuncParamList.
    let params = funcDecl.funcParams
    if (params.size != 3) {
        return -1
    }
    let param0 = params[0]
    if (param0.identifier.value != "a" || !(param0.paramType is PrimitiveType)) {
        return -1
    }

    let param2 = params[2]
    var v = match (param2.expr as LitConstExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    if (v.literal.value != "42") {
        return -1
    }

    if (funcDecl.lParen.kind == ILLEGAL) {
        return -1
    }

    if (funcDecl.rParen.kind == ILLEGAL) {
        return -1
    }

    if (funcDecl.isConst()) {
        return -1
    }

    // Test FuncBody.
    let block = funcDecl.block.nodes
    if (block.size != 3) {
        return -1
    }
    if ((block[0] is Decl)) {
        return 2
    }
    if (!(block[1] is Decl)) {
        return 3
    }
    if ((block[1] is Expr)) {
        return 4
    }
    if ((block[1] is Pattern)) {
        return 4
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
