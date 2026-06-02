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

  @Dependencies:  macros2.cj
*/

macro package macros

import std.ast.*
public import macros2.M2

public macro M1(input: Tokens): Tokens {
  @M2(input)
  quote(return 0)
}