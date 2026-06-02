/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        01_03_a03_003

  @Level:         1

  @Assertion:   1.3(3) The syntax of literal is defined as follows.
                   literalConstant
                       : IntegerLiteral
                       | FloatLiteral
                       | CharacterLiteral
                       | booleanLiteral
                       | stringLiteral
                       ;

                   stringLiteral
                       : lineStringLiteral
                       | multiLineStringLiteral
                       | MultiLineRawStringLiteral
                       ;

  @Description:  Checks that valid literalConstant can be assigned to variable
                 and that variable has correct type and value.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  

*/

import utils.assert.*

main(){

//Test case N1
    let var_01 = 2.0f16;
    Assert.equals(true, var_01 is Float16, 
        reason:"Test case N1: the variable assigned by Float16 literal has incorrect type");
    let checkingValue_01:Float16 = 1.0 + 1.0;
    Assert.equals(checkingValue_01, var_01, 
        reason:"""
Test case N1: The variable assigned by Float15 literal has incorrect value: ${var_01} """);

//Test case N2
    let var_02 = 3.0f32;
    Assert.equals(true, var_02 is Float32, 
        reason:"Test case N2: the variable assigned by Float32 literal has incorrect type");
    let checkingValue_02:Float32 = 1.0 + 2.0;
    Assert.equals(checkingValue_02, var_02, 
        reason:"""
Test case N2: The variable assigned by Float32 literal has incorrect value: ${var_02} """);

//Test case N3
    let var_03 = 4.0f64;
    Assert.equals(true, var_03 is Float64, 
        reason:"Test case N3: the variable assigned by Float64 literal has incorrect type");
    let checkingValue_03:Float64 = 2.0 + 2.0;
    Assert.equals(checkingValue_03, var_03, 
        reason:"""
Test case N3: The variable assigned by Float64 literal has incorrect value: ${var_03} """);

    return 0;
}

