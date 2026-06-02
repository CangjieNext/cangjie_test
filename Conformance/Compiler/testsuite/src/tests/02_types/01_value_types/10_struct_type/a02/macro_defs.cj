/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: macroExpression indicates the macro invocation expression.

  @Description: Macro definitions for the test

  @Structure: complex-aux

  @MacroLib
*/

macro package macros

import std.ast.*

public macro Macro1(name: Tokens, val: Tokens) {
  quote(var $name = $val)
}

public macro Macro2(name: Tokens, val: Tokens) {
  quote(let $name = $val)
}

public macro Macro3(name: Tokens, body: Tokens) {
  quote(func $name() {$body})
}

public macro Macro4(body: Tokens) {
  quote($body)
}