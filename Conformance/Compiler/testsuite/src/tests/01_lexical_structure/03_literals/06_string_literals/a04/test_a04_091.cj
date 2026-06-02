/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        01_03_06_a04_091

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

  @Description:  Checks that single-line string literal can be represented as lineStringExpression
                 of different types (String, Rune, Bool) containing calls of functions of corresponding type.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  
*/

import utils.assert.*

func getString(stringParam:String, extraIndicator:Int8):String
{
    var stringToReturn:String = "???";
    if (extraIndicator > 1 )
    {
        stringToReturn = stringParam;
    }

    return stringToReturn;
}

func getChar(charParam:Rune, extraIndicator:Int16):Rune
{
    var charToReturn:Rune = '?';
    if (extraIndicator > 1 )
    {
        charToReturn = charParam;
    }

    return charToReturn;
}

func getBool(boolParam:Bool, extraIndicator:Int32):Bool
{
    var boolToReturn:Bool = true;
    if (extraIndicator > 1 )
    {
        boolToReturn = boolParam;
    }

    return boolToReturn;
}

main(){
//Test_case_1
    let stringVar_01:String = "string_01;";
    var stringVar_02:String = "string_02;";
    let stringValue_01:String = "${getString(stringVar_01, 2) + " " + getString(stringVar_02, 3)}";
    let checkingString_01:String = "string_01; string_02;"
    Assert.equals(checkingString_01, stringValue_01, 
        reason:"Test_case_1: The single-line string has incorrect value.");

//Test_case_2
    let charVar_01:Rune = '1';
    var charVar_02:Rune = '2';
    let stringValue_02:String = "${getChar(charVar_01, 10) == getChar(charVar_02, 20)}";
    let checkingString_02:String = "false"
    Assert.equals(checkingString_02, stringValue_02, 
        reason:"Test_case_2: The single-line string has incorrect value.");

//Test_case_3
    let boolVar_01:Bool = true;
    let stringValue_03:String = "${getBool(boolVar_01, 11)}";
    let checkingString_03:String = "true"
    Assert.equals(checkingString_03, stringValue_03, 
        reason:"Test_case_3: The single-line string has incorrect value.");

//Test_case_4
    var boolVar_02:Bool = false;
    let stringValue_04:String = "${getBool(boolVar_02, 12)}";
    let checkingString_04:String = "false"
    Assert.equals(checkingString_04, stringValue_04, 
        reason:"Test_case_4: The single-line string has incorrect value.");

    return 0;
}

