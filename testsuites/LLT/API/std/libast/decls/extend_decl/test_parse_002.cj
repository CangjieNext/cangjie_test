// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
        extend<T> Foo<T> <: I1 {}
    )
    let extendDecl = (parseDecl(input) as ExtendDecl).getOrThrow()
    let output = quote($extendDecl)
    let flag = compareTokens(input, output) // libast offers compareTokens
    output.dump()
    if (!flag) {
        return 1
    }

    let extendedType = extendDecl.extendType // RefType
    if (!(extendedType is RefType)) {
        return 2
    }
    var refTy = (extendedType as RefType).getOrThrow()
    let types = refTy.typeArguments
    if (types.size != 1) {
        return 3
    }
    if ((types[0] as RefType).getOrThrow().identifier.value != "T") {
        return 4
    }

    if (extendDecl.genericConstraint.size != 0) {
        return 5
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
