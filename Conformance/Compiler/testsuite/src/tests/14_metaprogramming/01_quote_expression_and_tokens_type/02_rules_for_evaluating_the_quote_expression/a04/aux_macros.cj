/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Description:  Aux file with macro 'PlusOne' from example

  @Structure:    complex-aux

  @MacroLib
*/

macro package aux_macros
import std.ast.*

public macro PlusOne(input: Tokens): Tokens {
    quote(($input + 1))
}
