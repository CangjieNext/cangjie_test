/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package fileorg

import std.env.*
import std.sync.*

public class PublicApi {
    public func greet(): Unit {
        println("hello")
    }
}

class InternalHelper {}

func entry(): Int64 {
    return 1
}

main() {
    PublicApi().greet()
    println("${entry()}")
}
