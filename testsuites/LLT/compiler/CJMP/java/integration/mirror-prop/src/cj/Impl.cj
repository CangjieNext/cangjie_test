// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cj

import interoplib.interop.*
import java.lang.JObject

@JavaImpl
public class Impl <: M {
    let val = 10
    let sval = 5
    public init() {
        super(10) // TODO: replace with `val`
        println("Impl()")

        assert(x, val)
        assert(m.x, val)
        assert(xm, val)
        assert(m.xm, val)
        assert(M.xs, sval)
        assert(M.xms, sval)

        let mval = 15
        let mirror = M(mval)

        assert(mirror.x, mval)
        assert(mirror.m.x, mval)
        assert(mirror.xm, mval)
        assert(mirror.m.xm, mval)

    }
}

func assert<T>(left: Equatable<T>, right: T) {
    if (left != right) {
        let str = if (left is ToString && right is ToString) {
            "${(left as ToString).getOrThrow()} != ${(right as ToString).getOrThrow()}"
        } else {
            "values must be equal"
        }
        throw Exception("Assertion failed: ${str}")
    }
}