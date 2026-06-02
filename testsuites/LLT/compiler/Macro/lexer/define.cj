// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define

internal import std.ast.*

public macro A0(input: Tokens) {
    let x = """
        class AA {
            public let x = 1.0
        }
    """
    let y = """
        class AB {
            public let y = 1.0
        }
    """
    let z = cangjieLex(x) + cangjieLex(y)
    return z
}
