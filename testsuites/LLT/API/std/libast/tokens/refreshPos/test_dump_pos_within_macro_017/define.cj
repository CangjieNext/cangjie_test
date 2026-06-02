macro package define

import std.ast.*

public macro Outer(input: Tokens): Tokens {
    var tks = Token(AT) + input[0] + quote(
    class Demo {})
    println("-------position in Outer-------")
    tks.dump()
    return tks
}

public macro Inner(input: Tokens): Tokens {
    return input
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
