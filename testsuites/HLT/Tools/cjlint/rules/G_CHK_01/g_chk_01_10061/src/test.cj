/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.console.*
import stdx.encoding.json.*

interface A<T> {
    func test() {
        var a = { =>
            var v0 = Console.stdIn.readln().getOrThrow()
            var json = JsonString(v0)
            return json.toString()
        }
        a()
    }
}

class B <: A<Int64> {
}

main(): Int64 {
    B().test()
    0
}


