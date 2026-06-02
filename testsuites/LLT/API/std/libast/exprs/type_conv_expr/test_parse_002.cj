// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let code = """
          Float32(a+b)
        """

    let convTokens = cangjieLex(code)
    let convExpr = (parseExpr(convTokens) as TypeConvExpr).getOrThrow()
    let ty = convExpr.targetType
    let expr = convExpr.expr

    if (!(ty is PrimitiveType)) {
        return 1
    }
    let ty1 = (ty as PrimitiveType).getOrThrow()
    if (ty1.keyword.value != "Float32") {
        return 2
    }

    if (!(expr is BinaryExpr)) {
        return 3
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
