// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test

internal import std.process.*
internal import std.collection.*

main(): Int64 {
    var args = ArrayList<String>(Process.current.arguments)

    if (args.size < 2) {
        eprintln("Error: failed to get parameters")
        return 1
    }

    println("Result: \"${args[0]}\" appended with \"${args[1]}\" is \"${args[0] + " " + args[1]}\"")

    return 0
}
