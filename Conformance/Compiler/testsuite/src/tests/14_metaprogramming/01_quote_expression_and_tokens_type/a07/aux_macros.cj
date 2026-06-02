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
    var mc = quote(/*multi-line
            comment*/ 88)
    quote($mc)
}

public macro CompileTest2(input: Tokens): Tokens {
    var sc = quote(//single-line comment
                  77)
    quote($sc)
}

public macro CompileTest3(input: Tokens): Tokens {
    quote("string;string2";)
}

public macro CompileTest4(input: Tokens): Tokens {
    quote("""
    string
    string2
    string3
    
    """)
}