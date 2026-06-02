/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        01_03_06_a09_038

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
                 (varOrfuncDeclaration) of types UInt8, UInt16, UInt32, Uint64, containing calls 
                 of functions of corresponding type.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  
*/

import utils.assert.*

main(){
//Test_case_1
    let uint8Var_01:UInt8 = 255;
    let uint8Var_02:UInt8 = 55;
    let stringValue_01:String = """


${func getUInt8(uint8Param:UInt8):UInt8{return uint8Param;}; 
getUInt8(uint8Var_01) - getUInt8(uint8Var_02) + 1}""";
    let checkingString_01:String = "\n\n201"
    Assert.equals(checkingString_01, stringValue_01, 
        reason:"Test_case_1: The multi-line string has incorrect value.");

//Test_case_2
    let uint16Var_01:UInt16 = 65531;
    let uint16Var_02:UInt16 = 4;
    let stringValue_02:String = 
"""
${func getUInt16(uint16Param:UInt16):UInt16{return uint16Param;}; 
getUInt16(uint16Var_01) + 
getUInt16(uint16Var_02)}
""";
    let checkingString_02:String = "65535\n"
    Assert.equals(checkingString_02, stringValue_02, 
        reason:"Test_case_2: The multi-line string has incorrect value.");

//Test_case_3
    let uint32Var_01:UInt32 = 65536;
    let uint32Var_02:UInt32 = 65537;
    let stringValue_03:String = 

"""

${func getUInt32(uint32Param:UInt32):UInt32{return uint32Param;}; 
getUInt32(uint32Var_01) + getUInt32(uint32Var_02)}
""";
    let checkingString_03:String = "\n131073\n"
    Assert.equals(checkingString_03, stringValue_03, 
        reason:"Test_case_3: The multi-line string has incorrect value.");

//Test_case_4
    let uint64Var_01:UInt64 = 8446744073709551615;
    let uint64Var_02:UInt64 = 2;
    let stringValue_04:String = """
${func getU64(uint64Param:UInt64):UInt64{return uint64Param;}; getU64(uint64Var_01) - getU64(uint64Var_02) + 1}""";
    let checkingString_04:String = "8446744073709551614"
    Assert.equals(checkingString_04, stringValue_04, 
        reason:"Test_case_4: The multi-line string has incorrect value.");

    return 0;
}

