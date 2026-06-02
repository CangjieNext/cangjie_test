/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
macro package define

import std.ast.*

public macro M(input: Tokens) {
    let tks = cangjieLex(
"""
let x = { w: A<T>= > w }
"""
    )
    parseProgram(tks)
    return input
}