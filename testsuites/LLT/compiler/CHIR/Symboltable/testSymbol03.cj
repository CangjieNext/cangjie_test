// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC:%compiler %n.cj %compile_lib_opt

internal import std.collection.*

interface test<T> {
    static func out(input: T) {
        func x(inp: Int64): T {
            return input
        }
        var i: Int64 = 10
        var myArray: ArrayList<T> = ArrayList<T>(i, x)
    }
}
