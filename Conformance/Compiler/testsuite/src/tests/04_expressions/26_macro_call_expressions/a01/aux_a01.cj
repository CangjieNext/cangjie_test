/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Description: Macro for the test
  @Structure: complex-aux
  @MacroLib
*/

macro package aux_a01

import std.ast.*

public macro letDecl(attr: Tokens, name: Tokens) {
  quote(var $name: $attr = 123)
}

public macro funcDecl(attr: Tokens, val: Tokens) {
  quote(func $attr() {return $val})
}
