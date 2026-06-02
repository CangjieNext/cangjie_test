macro package define

import std.ast.*

public macro Inject(input: Tokens): Tokens {
    var ret = input
    var vd = parseDecl(input)
    var isPrivate = false
    for (mod in vd.modifiers) {
        if (mod.keyword.kind == PRIVATE) {
            isPrivate = true
            break
        }
    }
    if (!isPrivate) {
        diagReport(DiagReportLevel.ERROR, vd.toTokens(),
            "The Inject macro only be used on a field with private modifier", "Modify the field with private keyword")
    }

    return ret
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
