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

macro package aux_macros
import std.ast.*

public macro CompileTest1(input: Tokens): Tokens {
    let t0: Tokens = quote(45 - 40)
    let t1: Tokens = quote(45) + Token(SUB) + Token(INTEGER_LITERAL, "40")

    quote($t0 == $t1)
}

public macro CompileTest2(input: Tokens): Tokens {
    var t0: Tokens = quote(45 - 40)
    t0 += Token(ADD) + quote(10)
    let t1: Tokens = quote(45) + Token(SUB) + Token(INTEGER_LITERAL, "40") + quote(+10)

    quote($t0 == $t1)
}