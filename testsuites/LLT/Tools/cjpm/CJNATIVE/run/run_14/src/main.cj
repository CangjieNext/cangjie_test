// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package b

internal import std.process.*
internal import std.collection.*

main(): Int64 {
    let args = ArrayList<String>(Process.current.arguments)
    if (args.size > 0 && args[0] == "aaa") {
        println("true")
    } else {
        println("false")
    }
    return 0
}
