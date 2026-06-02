/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Description:  Aux file with macro for testing

  @Structure:    complex-aux

  @MacroLib
*/

macro package aux_macros

import std.ast.*

public macro domain(input: Tokens): Tokens {
    print("Compiling the macro `domain` ...\n")
    quote("@" + $input)
}
