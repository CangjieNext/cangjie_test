/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// annotation/mirror.cj
macro package GenericMacro.annotation

internal import std.ast.*

// 内容、位置关系与待置换函数完全一致
public macro correctMirror(funcDeclTokens: Tokens): Tokens {
    var correctTokens = quote(
public func returnSelf1<T>(variable: T): T {
    return variable
}
    )
    return correctTokens
}

// 内容一致、位置关系不一致: Internal error: the Position is empty!
public macro wrongMirror(funcDeclTokens: Tokens): Tokens {
    var wrongTokens = quote(
public func returnSelf2<T>(variable: T): T {
    return variable
}
    )
    return wrongTokens
}

// 内容不一致、位置关系一致: Internal error: the Position is empty!
public macro wrongMirror2(funcDeclTokens: Tokens): Tokens {
    var wrongTokens = quote(
public func returnSelf3<T>(variable: T): T where T <: ToString {
    return variable
}
    )
    return wrongTokens
}

// 内容不一致、位置不一致、但不涉及泛型
public macro correctMirror2(funcDeclTokens: Tokens): Tokens {
    var wrongTokens = quote(
        public func returnSelf4(variable: Int64): Int64 {
            return variable
        }
    )
    return wrongTokens
}
