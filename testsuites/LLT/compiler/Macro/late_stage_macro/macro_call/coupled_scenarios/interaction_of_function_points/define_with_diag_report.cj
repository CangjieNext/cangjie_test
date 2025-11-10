// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define

import stdx.syntax.*
import stdx.syntax

public late macro testDefLate(input: Expr): Expr {
    let tks = input.toTokens()
    for (i in 0..tks.size) {
        if (tks[i].kind == IDENTIFIER) {
            diagReport(DiagReportLevel.ERROR, tks[i..(i + 1)],
                       "This expression is not allowed to contain identifier",
                       "Here is the illegal identifier")
        }
    }
    return input
}