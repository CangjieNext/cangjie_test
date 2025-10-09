/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
macro package define

import std.ast.*
import std.convert.*

public macro M(a: Tokens, b: Tokens) {
    var res = quote({)
    for (i in 0..(Int64.tryParse(a[0].value) ?? 0)) {
        var temp = Tokens()
        for (j in 1..(b.size - 1)) {
            if (b[j].value == "x") {
                temp += (quote($i))
            } else {
                temp += (b[j])
            }
        }
        res += (temp)
    }
    res += quote(})
    return res
}
