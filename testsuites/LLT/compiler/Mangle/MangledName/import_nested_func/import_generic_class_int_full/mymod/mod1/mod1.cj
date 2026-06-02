// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package mymod.mod1

import std.collection.*

public open class MyClassA<K> {
    public func foo(): () -> Int64 {
        func koo(): Int64 {
            return 100
        }

        koo
    }
    public func foo(c: String): () -> Int64 {
        func koo(): Int64 {
            return 200
        }

        koo
    }
}
