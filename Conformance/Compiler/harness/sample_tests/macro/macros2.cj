/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Structure: complex-aux

  @MacroLib
*/

macro package macros2

import std.ast.*

public macro M2(input: Tokens): Tokens {
  return quote(println($(input));)
}