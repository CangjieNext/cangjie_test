// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main() {
    var input = quote(
        var cstr: CFunc<(CString, CString) -> CString> = {a, b =>}
    )
    var decl = (parseDecl(input) as VarDecl).getOrThrow()
    var ty = (decl.declType as RefType).getOrThrow().toTokens()
    ty.dump()
    if (ty[0].kind != TokenKind.IDENTIFIER) {
        return 1
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
