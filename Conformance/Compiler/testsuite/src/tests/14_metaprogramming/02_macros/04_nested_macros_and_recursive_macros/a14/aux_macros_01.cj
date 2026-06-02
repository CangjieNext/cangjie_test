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

macro package aux_macros_01
import std.ast.*

public macro A(input: Tokens): Tokens {
    let tmp = A_part_0(input)
    if cond {
        return quote($tmp)
    }
    let bb: Tokens = @A(quote($tmp))  // error, recursive macro
                                    // expression not in quote
    A_part_1()
}
