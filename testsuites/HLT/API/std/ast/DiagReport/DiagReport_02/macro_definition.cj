/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
macro package macro_definition

import std.ast.*

public macro TestDef(input: Tokens): Tokens {
    diagReport(WARNING, input, 1, 1)
    return input
}
