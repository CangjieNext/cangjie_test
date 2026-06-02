/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: A class body consists of the following parts.
              • optional static initializer
              • optional primary constructor definition
              • optional constructors definition
              • optional member variables definition
              • optional member functions and member operator functions definition or declaration
              • optional member properties definition or declaration
              • optional macro expression

  @Description: Macro for the test

  @MacroLib

  @Structure: complex-aux
  
*/

macro package t01

import std.ast.*

public macro NewVariable(attr: Tokens, name: Tokens) {
  quote(var $name: $attr = 12)
}

public macro FuncThatReturns(attr: Tokens, val: Tokens) {
  quote(func $attr() {return $val})
}

public macro ModifiesGlobal(attr: Tokens, val: Tokens) {
  quote(func $attr() {indicator = $val})
}

public macro NothingMacros(name: Tokens) {
  quote(func $name() {})
}

main() {
}
