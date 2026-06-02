// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package mod1.p3

internal import std.ast.*

public macro M1(input: Tokens) {
    let decl = (parseDecl(input) as ClassDecl).getOrThrow()
    let name = decl.identifier.value
    let greeting = name + " sayHi"
    return quote(
    class $(decl.identifier) {
      $(decl.body.decls)
      func sayHi() {
        println($greeting)
      }
    }
  )
}

public macro M2(input: Tokens) {
    input
}
