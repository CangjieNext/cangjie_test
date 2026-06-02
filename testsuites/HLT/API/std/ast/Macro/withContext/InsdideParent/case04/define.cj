/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
macro package define

import std.ast.*

public macro Outer(input: Tokens) {
    return input
}

public macro Inner(input: Tokens) {
    if (insideParentContext()) {
        return input
    } else {
        return input
    }
}
