/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        01_03_06_a09_037

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
                 (varOrfuncDeclaration) of types Int8, Int16, Int32< int64, containing calls of 
                 functions of corresponding type.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  
*/

import utils.assert.*

main(){
//Test_case_1
    let int8Var_01:Int8 = 127;
    let int8Var_02:Int8 = 7;
    let stringValue_01:String = """
${func getInt8(int8Param:Int8):Int8{return int8Param;}; getInt8(int8Var_01) - getInt8(int8Var_02) + 1}""";
    let checkingString_01:String = "121"
    Assert.equals(checkingString_01, stringValue_01, 
        reason:"Test_case_1: The multi-line string has incorrect value.");


//Test_case_2
    let int16Var_01:Int16 = 32767;
    let int16Var_02:Int16 = 32007;
    let stringValue_02:String = 
"""
${func getInt16(int16Param:Int16):Int16{return int16Param;}; getInt16(int16Var_01) - getInt16(int16Var_02) + 1}
""";
    let checkingString_02:String = "761\n"
    Assert.equals(checkingString_02, stringValue_02, 
        reason:"Test_case_2: The multi-line string has incorrect value.");

//Test_case_3
    let int32Var_01:Int32 = -32769;
    let int32Var_02:Int32 = 9;
    let stringValue_03:String = """
${func getInt32(int32Param:Int32):Int32{return int32Param;}; getInt32(int32Var_01) + 
getInt32(int32Var_02)}

""";
    let checkingString_03:String = "-32760\n\n";
    Assert.equals(checkingString_03, stringValue_03, 
        reason:"Test_case_3: The multi-line string has incorrect value.");

//Test_case_4
    let int64Var_01:Int64 = 65;
    let int64Var_02:Int64 = 2;
    let stringValue_04:String = """

${func getInt64(int64Param:Int64):Int64{return int64Param;}; 
getInt64(int64Var_01) - getInt64(int64Var_02) + 1}""";
    let checkingString_04:String = "\n64"
    Assert.equals(checkingString_04, stringValue_04, 
        reason:"Test_case_4: The multi-line string has incorrect value.");

    return 0;
}

