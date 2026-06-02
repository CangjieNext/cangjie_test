/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        01_03_06_a04_113

  @Level:         1

  @Assertion:   1.3.6(4) The syntax of the single-line string literal is:
                    lineStringLiteral
                        : '"' (lineStringExpression | lineStringContent)* '"'
                        ;
                    lineStringExpression
                        : '${' SEMI* (expressionOrDeclaration (SEMI+ expressionOrDeclaration?)*) SEMI* '}'
                        ;
                    lineStringContent
                        : LineStrText
                        ;
                    LineStrText
                        : ~["\\\r\n]
                        | EscapeSeq ;

  @Description:  Checks that single-line string literal cannot be represented as lineStringExpression
                 which contains calls of functions of different types: Rune and Float16.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:  
*/

func getChar(charParam:Rune):Rune
{
    return charParam;
};

func getFloat16(float16Param:Float16):Float16
{
    return float16Param;
};

main(){
    let charVar:Rune = '9';
    var float16Var:Float16 = 100.5; 
    let stringValue:String = "${getChar(charVar) + getFloat16(float16Var)}";
    return 0;
}

