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

open class A {
    public var x: Tokens
    public init(x: Tokens) {
        this.x = x
    }
}

class B <: A {
    public init(x: Tokens) {
        super(x)
    }
}

main() {
    B(quote(1))
    return 0
}
