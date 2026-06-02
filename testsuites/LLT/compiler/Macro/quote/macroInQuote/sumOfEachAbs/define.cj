// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define

internal import std.ast.*

public macro SumOfEachAbs(input: Tokens) {
    let expr = parseExpr(input)
    if (expr is BinaryExpr) {
        let binExpr = (expr as BinaryExpr).getOrThrow()
        let le = binExpr.leftExpr
        let re = binExpr.rightExpr
        return quote(@SumOfEachAbs($le) * @SumOfEachAbs($re))
    }
    input
}
