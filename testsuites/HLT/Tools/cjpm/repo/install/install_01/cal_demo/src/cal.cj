// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cal_demo_exec

import std.env.*
import std.convert.*
import add_demo.*
import del_demo.*

public func calAdd(a: Int64, b: Int64): Int64 {
    add(a, b)
}

public func calDel(a: Int64, b: Int64): Int64 {
    del(a, b)
}

main(): Int64 {
    let args = getCommandLine()[1..]
    let a = Int64.parse(args[0])
    let b = Int64.parse(args[1])
    if (args[2] == "add") {
        println("add result: ${calAdd(a, b)}")
    } else if (args[2] == "del") {
        println("del result: ${calDel(a, b)}")
    } else {
        println("no calculation ")
    }
    0
}