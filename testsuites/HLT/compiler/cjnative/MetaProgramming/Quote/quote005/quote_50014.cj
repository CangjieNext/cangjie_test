/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_macro %f

import std.ast.*

class A {
    public var a: Tokens
    public init(input: Tokens) {
        this.a = input
    }
}

main() {
    A(quote(1))
    return 0
}
