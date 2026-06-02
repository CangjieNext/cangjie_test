// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test

import std.collection.*
import memory.*

@memoize[true]
func FibWithMemo(n: Int64): Int64 {
    if (n == 0 || n == 1) {
        return n
    }
    return FibWithMemo(n - 1) + FibWithMemo(n - 2)
}

main() {
    println("${FibWithMemo(10)}")
}
