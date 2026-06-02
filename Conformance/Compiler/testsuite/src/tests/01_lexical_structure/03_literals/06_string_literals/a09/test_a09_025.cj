/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        01_03_06_a09_025

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
                 (varOrfuncDeclaration) of types UInt8, UInt16, UInt32, UInt64.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  
*/

import utils.assert.*

main(){
//Test_case_1
    let stringValue_01:String = """


${let uint8Var_01:UInt8 = 255; let uint8Var_02:UInt8 = 55; 
uint8Var_01 - uint8Var_02 + 1}""";
    let checkingString_01:String = "\n\n201"
    Assert.equals(checkingString_01, stringValue_01, 
        reason:"Test_case_1: The multi-line string(varOrfuncDeclaration) has incorrect value.");

//Test_case_2
    let stringValue_02:String = 
"""
${let uint16Var_01:UInt16 = 65531; let uint16Var_02:UInt16 = 4; uint16Var_01 + uint16Var_02}
""";
    let checkingString_02:String = "65535\n"
    Assert.equals(checkingString_02, stringValue_02, 
        reason:"Test_case_2: The multi-line string(varOrfuncDeclaration) has incorrect value.");

//Test_case_3
    let stringValue_03:String = """
${let uint32Var_01:UInt32 = 65536; let uint32Var_02:UInt32 = 65537; uint32Var_01 + uint32Var_02}""";
    let checkingString_03:String = "131073"
    Assert.equals(checkingString_03, stringValue_03, 
        reason:"Test_case_3: The multi-line string(varOrfuncDeclaration) has incorrect value.");

//Test_case_4
    let stringValue_04:String = """
${let uint64Var_01:UInt64 = 8446744073709551615; let uint64Var_02:UInt64 = 2; uint64Var_01 - uint64Var_02 + 1}


""";
    let checkingString_04:String = "8446744073709551614\n\n\n"
    Assert.equals(checkingString_04, stringValue_04, 
        reason:"Test_case_4: The multi-line string(varOrfuncDeclaration) has incorrect value.");

    return 0;
}

