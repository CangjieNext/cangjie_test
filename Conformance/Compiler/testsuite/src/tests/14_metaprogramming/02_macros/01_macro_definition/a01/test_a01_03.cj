/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_01_a01_03

  @Level:         1

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

  @Description:  Negative check of macro definitions syntax w\o macro keyword
  
  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_macros_02.cj

*/

import std.ast.*
import aux_macros_02.*

main(): Unit {
    var r1 = @macroWithoutMacro(1)
}
