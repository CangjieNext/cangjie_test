/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_01_a01_01

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

  @Description:  Check the macro definitions syntax
  
  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

*/

import std.ast.*
import aux_macros.*

main(): Unit {
    var r1 = @macroWithoutAttrParam0(1)
    var r2 = @macroWithoutAttrParam1(2)
    var r3 = @macroWithAttrParam0[Int16](3)
    var r4 = @macroWithAttrParam1[Int32](4)
}
