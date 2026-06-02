// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
        let arr5: VArray<Int64, \$5> = VArray<Int64, \$5>({i => i})
    )
    let varrayDecl = (parseDecl(input) as VarDecl).getOrThrow()
    let varrayType = varrayDecl.declType

    if (!(varrayType is VArrayType)) {
        return 1
    }
    let vType = (varrayType as VArrayType).getOrThrow()
    let typeArgument = vType.elementTy
    if (!(typeArgument is PrimitiveType)) {
        return 2
    }
    let constantType = vType.size
    if (constantType.value != "5") {
        return 3
    }
    let initVArray = varrayDecl.expr
    let s = (initVArray as VArrayExpr).getOrThrow().arguments
    if (s.size != 1) {
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
