/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Description:  Aux file with macros for test_a04_12.
  @Structure:    complex-aux
  @MacroLib
*/

macro package aux_a04_12

import std.ast.*

public macro Concat(first: Tokens, second: Tokens): Tokens {
    quote($(first) + $(second))
}
