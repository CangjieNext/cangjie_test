// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input1 = quote(
        public var a: Int32 = 2021
    )
    let input2 = quote(
        let b = 2022
    )
    let input3 = quote(
        const b = 2022
    )

    let varDecl1 = (parseDecl(input1) as VarDecl).getOrThrow()
    let anno = varDecl1.annotations
    if (anno.size != 0) {
        return -1
    }
    let modifiers = varDecl1.modifiers
    if (modifiers.size != 1 || modifiers[0].keyword.value != "public") {
        return -1
    }
    if (!(varDecl1.declType is PrimitiveType)) {
        return -1
    }
    if (varDecl1.keyword.value != "var" || !(varDecl1.expr is LitConstExpr)) {
        return -1
    }
    if (varDecl1.isConst()) {
        return -1
    }
    let varDecl2 = (parseDecl(input2) as VarDecl).getOrThrow()
    if (varDecl2.keyword.value != "let") {
        return -1
    }
    let varDecl3 = (parseDecl(input3) as VarDecl).getOrThrow()
    if (!varDecl3.isConst()) {
        return -1
    }
    /*
     */
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
