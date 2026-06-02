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

  @Dependencies: aux_macros_02.cj
*/

macro package aux_macros_01
import std.ast.*
import aux_macros_02.*

public macro callGenMacro(x: Tokens) {
    @genMacro(x)  // w/0 error: undeclared identifier 'genMacro'
}
