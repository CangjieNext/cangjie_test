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

// Non-attribute macros
public macro Twice(input: Tokens): Tokens
{
    print("Compiling the macro `Twice` ...\n")
    quote($input; $input)
}

// Attributed macros
public macro Joint(attr: Tokens, input: Tokens): Tokens
{
    print("Compiling the macro `Joint` ...\n")
    quote($attr; $input)
}

// Non-attribute macros
public macro MacroWithoutParens(input: Tokens): Tokens
{
    print("Compiling the macro `MacroWithoutParens` ...\n")
    quote(func foo() { $input })
}

public macro echo(input: Tokens) {
    return input
}