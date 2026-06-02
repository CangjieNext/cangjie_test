/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        01_03_06_a04_092

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
                 of different types (Int8, Int16, Int32, Int64) containing calls of functions of 
                 corresponding type.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  
*/

import utils.assert.*

func getInt8(int8Param:Int8, extraIndicator:Int64):Int8
{
    var int8ToReturn:Int8 = 0;
    if (extraIndicator > 1 )
    {
        int8ToReturn = int8Param;
    }

    return int8ToReturn;
}

func getInt16(int16Param:Int16, extraIndicator:Int64):Int16
{
    var int16ToReturn:Int16 = 0;
    if (extraIndicator > 1 )
    {
        int16ToReturn = int16Param;
    }

    return int16ToReturn;
}

func getInt32(int32Param:Int32, extraIndicator:Int64):Int32
{
    var int32ToReturn:Int32 = 0;
    if (extraIndicator > 1 )
    {
        int32ToReturn = int32Param;
    }

    return int32ToReturn;
}

func getInt64(int64Param:Int64, extraIndicator:Int64):Int64
{
    var int64ToReturn:Int64 = 0;
    if (extraIndicator > 1 )
    {
        int64ToReturn = int64Param;
    }

    return int64ToReturn;
}

main(){
//Test_case_1
    let int8Var_01:Int8 = 127;
    let int8Var_02:Int8 = 7;
    let stringValue_01:String = "${getInt8(int8Var_01, 2) - getInt8(int8Var_02, 7) + 1}";
    let checkingString_01:String = "121"
    Assert.equals(checkingString_01, stringValue_01, 
        reason:"Test_case_1: The single-line string has incorrect value.");


//Test_case_2
    let int16Var_01:Int16 = 32767;
    let int16Var_02:Int16 = 32007;
    let stringValue_02:String = "${getInt16(int16Var_01, 5) - getInt16(int16Var_02, 8) + 1}";
    let checkingString_02:String = "761"
    Assert.equals(checkingString_02, stringValue_02, 
        reason:"Test_case_2: The single-line string has incorrect value.");

//Test_case_3
    let int32Var_01:Int32 = -32769;
    let int32Var_02:Int32 = 9;
    let stringValue_03:String = "${getInt32(int32Var_01, 50) + getInt32(int32Var_02, 8)}";
    let checkingString_03:String = "-32760";
    Assert.equals(checkingString_03, stringValue_03, 
        reason:"Test_case_3: The single-line string has incorrect value.");

//Test_case_4
    let int64Var_01:Int64 = 65;
    let int64Var_02:Int64 = 2;
    let stringValue_04:String = "${getInt64(int64Var_01, 51) - getInt64(int64Var_02, 81) + 1}";
    let checkingString_04:String = "64"
    Assert.equals(checkingString_04, stringValue_04, 
        reason:"Test_case_4: The single-line string has incorrect value.");

    return 0;
}

