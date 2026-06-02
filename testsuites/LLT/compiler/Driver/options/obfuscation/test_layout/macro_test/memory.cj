// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package memory

import std.ast.*
import std.collection.*

func checkBooleanAttr(attr: Tokens): Bool {
    // true or false
    if (attr.size != 1 || attr[0].kind != TokenKind.BOOL_LITERAL) {
        throw IllegalArgumentException("Attribute for memoize should be true or false")
    }
    return attr[0].value == "true"
}

public macro memoize(attr: Tokens, input: Tokens): Tokens {
    let memoized: Bool = checkBooleanAttr(attr)

    // no memorization
    if (!memoized) {
        return input
    }

    // optimizing with memory
    let fd = parseDecl(input)

    return quote(
        var memoMap: HashMap<Int64, Int64> = HashMap<Int64, Int64>()

        func $(fd.identifier)(n: Int64): Int64 {
            if (memoMap.contains(n)) {
                return memoMap.get(n).getOrThrow()
            }
            if (n == 0 || n == 1) {
                return n
            }
            let ret = FibWithMemo(n-1) + FibWithMemo(n-2)
            memoMap.add(n, ret)
            return ret
        }
    )
}
