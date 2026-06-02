/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        01_03_06_a09_036

  @Level:         1

  @Assertion:   1.3.6(9) The syntax of the multi-line string literal is:
                   multiLineStringLiteral
                       : '"""' NL (multiLineStringExpression | multiLineStringContent)* '"""'
                       ;
                   multiLineStringExpression
                       : '${' end* (expressionOrDeclaration (end+ expressionOrDeclaration?)*) end* '}'
                       ;
                   multiLineStringContent
                       : MultiLineStrText
                       ;
                   MultiLineStrText
                       : ~('\\')
                       | EscapeSeq ;

  @Description:  Checks that multi-line string literal can be represented as multiLineStringExpression
                 (varOrfuncDeclaration) of types String, Rune, Bool, containing calls of functions 
                 of corresponding type..

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  
*/

import utils.assert.*

main(){
//Test_case_1
    let stringVar_01:String = "string_01;";
    var stringVar_02:String = "string_02;";
    let stringValue_01:String = """
${func getString(stringParam:String):String{return stringParam;}; 
getString(stringVar_01) + " " + getString(stringVar_02)}""";
    let checkingString_01:String = "string_01; string_02;"
    Assert.equals(checkingString_01, stringValue_01, 
        reason:"Test_case_1: The multi-line string has incorrect value.");

//Test_case_2
    let charVar_01:Rune = '1';
    var charVar_02:Rune = '2';
    let stringValue_02:String = 
"""
${func getChar(charParam:Rune):Rune{return charParam;}; 
getChar(charVar_01) == getChar(charVar_02)}
""";
    let checkingString_02:String = "false\n"
    Assert.equals(checkingString_02, stringValue_02, 
        reason:"Test_case_2: The multi-line string has incorrect value.");

//Test_case_3
    let boolVar_01:Bool = true;
    let stringValue_03:String = 
"""
${func getBool(boolParam:Bool):Bool{return boolParam;}; getBool(boolVar_01)}

""";
    let checkingString_03:String = "true\n\n"
    Assert.equals(checkingString_03, stringValue_03, 
        reason:"Test_case_3: The multi-line string has incorrect value.");

//Test_case_4
    var boolVar_02:Bool = false;
    let stringValue_04:String = """
${func getBool(boolParam:Bool):Bool{return boolParam;}; getBool(boolVar_02)}""";
    let checkingString_04:String = "false"
    Assert.equals(checkingString_04, stringValue_04, 
        reason:"Test_case_4: The multi-line string has incorrect value.");

    return 0;
}

