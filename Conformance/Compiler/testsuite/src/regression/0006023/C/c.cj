/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Structure:    complex-aux
  @MacroLib

  @Dependencies: ../A/A.cj ../B/B.cj
*/

// C.cj
macro package c

import std.ast.*
public import a.*                     // only macro packages can be public
                                      // import in macro packages
// public import B.*                  // error: normal packages can not be
                                      // public import in macro packages
import b.*
public macro M2(input:Tokens):Tokens{
  return @M1(input) + quote($(F1(1)))
}