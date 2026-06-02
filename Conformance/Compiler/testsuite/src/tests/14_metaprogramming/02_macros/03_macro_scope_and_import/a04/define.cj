/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Description:  Aux file with some macros for testing

  @Structure:    complex-aux

  @MacroLib
*/

// modify package with macro
macro package define       
import std.ast.*

// public func A() {}      // error: func A can not be modified by `public`

public macro M(input: Tokens): Tokens {    // only macros can be modified
                                           // by `public`
  return input
}