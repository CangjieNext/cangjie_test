/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package combopkg

import std.collection.HashMap
import std.sync.*
import std.env.*

class Node {
    public init() {
    }
    public func go(): Int64 {
        return 1
    }
}

func top(n: Int64): Int64 {
    if (n > 0) {
        return 1
    }
    return 0
}

main() {
    let x = Node()
    println(x.go())
    println(top(1))
}
