/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: The class body is consisted of zero or more member declarations which are enclosed in a pair of curly brackets.

  @Description: Macro definitions for the test

  @MacroLib

  @Structure: complex-aux
*/

macro package t01

import std.ast.*

public macro Ident(name: Tokens): Tokens {
  quote(func $name(x: Int32) { return x} )
}

public macro Add(name: Tokens): Tokens {
  quote(func $name(a: Int64, b: Int64) { return a + b} )
}

public macro Sub(name: Tokens): Tokens {
  quote(func $name(a: Int64, b: Int64) { return a - b} )
}

public macro Concat(name: Tokens): Tokens {
  quote(func $name(a: String, b: String) { return "${a}${b}" } )
}
