/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        01_03_06_a04_097

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
                 (varOrfuncDeclaration) of different types (UInt8, UInt16, UInt32, UInt64)
                  containing calls of functions of corresponding type.

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
    let stringValue_01:String =
        "${func getUInt8(p:UInt8):UInt8{return p;}; getUInt8(uint8Var_01) - getUInt8(uint8Var_02) + 1}";
    let checkingString_01:String = "201"
    Assert.equals(checkingString_01, stringValue_01, 
        reason:"Test_case_1: The single-line string has incorrect value.");

//Test_case_2
    let uint16Var_01:UInt16 = 65531;
    let uint16Var_02:UInt16 = 4;
    let stringValue_02:String =
        "${func getUInt16(p:UInt16):UInt16{return p;}; getUInt16(uint16Var_01) + getUInt16(uint16Var_02)}";
    let checkingString_02:String = "65535"
    Assert.equals(checkingString_02, stringValue_02, 
        reason:"Test_case_2: The single-line string has incorrect value.");

//Test_case_3
    let uint32Var_01:UInt32 = 65536;
    let uint32Var_02:UInt32 = 65537;
    let stringValue_03:String =
        "${func getUInt32(p:UInt32):UInt32{return p;}; getUInt32(uint32Var_01) + getUInt32(uint32Var_02)}";
    let checkingString_03:String = "131073"
    Assert.equals(checkingString_03, stringValue_03, 
        reason:"Test_case_3: The single-line string has incorrect value.");

//Test_case_4
    let uint64Var_01:UInt64 = 8446744073709551615;
    let uint64Var_02:UInt64 = 2;
    let stringValue_04:String =
        "${func getUInt64(p:UInt64):UInt64{return p;}; getUInt64(uint64Var_01) - getUInt64(uint64Var_02) + 1}";
    let checkingString_04:String = "8446744073709551614"
    Assert.equals(checkingString_04, stringValue_04, 
        reason:"Test_case_4: The single-line string has incorrect value.");

    return 0;
}

