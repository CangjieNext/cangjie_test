/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Description:  Aux file with some macros for testing

  @Assertion:    14.2.1(1) In Cangjie programming language, macro definitions comply with the following syntax rules:
                macroDefinition
                    : 'public' 'macro' identifier
                    (macroWithoutAttrParam | macroWithAttrParam)
                    (':' identifier)?
                    ('=' expression | block)
                    ;
                macroWithoutAttrParam
                    : '(' macroInputDecl ')'
                    ;
                macroWithAttrParam
                    : '(' macroAttrDecl ',' macroInputDecl ')'
                    ;
                macroInputDecl
                    : identifier ':' identifier
                    ;
                macroAttrDecl
                    : identifier ':' identifier
                    ; 

  @Structure:    complex-aux

  @MacroLib
*/

macro package aux_macros_04
import std.ast.*

public macro macroWithoutParam() {
    Tokens()
}
