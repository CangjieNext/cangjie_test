// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package b

import b.test.*
internal import std.ast.*

var flag = false

main(): Int64 {
    @M(flag = true) // will make flag be true while compiling.
    if (flag) {
        println("true")
    } else {
        println("false")
    }

    @M(quote(flag = false)) // will not change flag value.
    if (flag) {
        println("true")
    } else {
        println("false")
    }
    return 0
}
