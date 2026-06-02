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

  @Dependencies: b_01.cj
*/

// c.cj
macro package c_02
import std.ast.*
public import a.*                     // only macro packages can be public
                                      // import in macro packages
// public import b.*                     // error: normal packages can not be
                                      // public import in macro packages
import b_01.*
public macro M2(input:Tokens):Tokens{
      return @M1(input) + Token(TokenKind.ADD) + quote($(F1(1)))
}

