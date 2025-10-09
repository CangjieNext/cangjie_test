/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package demo

internal import std.collection.*

class User {
    User(let name!: String, let age!: Int32) {}
}

main(): Int64 {
    let users = [
        User(name: "u1", age: 32),
        User(name: "u2", age: 18)
    ]

    let names = users |> map {it => it.name} |> collectString<String>(delimiter: ",")
    println("hello ${names}")

    0
}
