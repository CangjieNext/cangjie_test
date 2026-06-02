/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Description:  Aux file with macros for testing
  @Structure:    complex-aux
  @MacroLib
*/
macro package aux_macros

import std.ast.*

public macro PlusOne(input: Tokens): Tokens {
    print("Compiling the macro `PlusOne` ...\n")
    quote(($input + 1))
}

public macro Plus555(input: Tokens): Tokens {
    print("Compiling the macro `Plus555` ...\n")
    quote($(input) + 555)
}

public macro Plus(attr:Tokens, input: Tokens): Tokens {
    print("Compiling the macro `Plus` ...\n")
    quote($(input) + $attr)
}

public macro Concat(first: Tokens, second: Tokens): Tokens {
    print("Compiling the macro `Concat` ...\n")
    quote($(first) + $(second))
}
