macro package define

import std.ast.*

public macro M(input: Tokens): Tokens {
    let fp = FuncParam(input)
    println("constructor funcParam:")
    fp.dump()
    return input
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */