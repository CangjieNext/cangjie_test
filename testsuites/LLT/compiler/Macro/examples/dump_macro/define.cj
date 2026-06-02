macro package pkg1
internal import std.ast.*

public macro Foo(input: Tokens) : Tokens
{
    return input
}

public macro Bar(input: Tokens) : Tokens
{
    return quote(
      class A {
          var a: Int32 = 2
          func getA() {
              return a_
          }
      }
    )
}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
