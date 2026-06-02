/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_a02_023

  @Level:         1

  @Assertion:    2(2) At the same time, it is a strongly typed language, 
                 i.e. every expression is associated with a type and the type of 
                 expression not only decides its possible values, but also decides that 
                 can be performed on them.

  @Description:  Checks that the attempts to assign:
                 - a expression, calculating a value of type Int8, to a variable 
                   declared without type does not cause compilation error;
                 - a expression, calculating a value of type Int16, to a variable 
                   declared with the same type does not cause compilation error;
                 - a expression, calculating a value of type Float16, to a variable 
                   declared without type does not cause compilation error;
                 - a expression, calculating a value of type Float64, to a variable 
                   declared with the same type does not cause compilation error;
                 - a expression, calculating a value of type String, to a variable 
                   declared without type does not cause compilation error;
                 - a expression, calculating a value of type String, to a variable 
                   declared with the same type does not cause compilation error;

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

  @Comment:  

*/

class TestClass {};

main() {
//Test_case_1
    let operand_11: Int8 = 100;
    var operand_12 = 27i8;
    var expression_result_1 = operand_11 + operand_12;

//Test_case_2
    let operand_21: Int16 = 100;
    var operand_22 = 200i16;
    var expression_result_2: Int16 = operand_21 + operand_22;

//Test_case_3
    let operand_31: Float16 = 1.5;
    var operand_32 = 6.5f16;
    var expression_result_3 = operand_31 + operand_32;

//Test_case_4
    let operand_41: Float64 = 5.5;
    var operand_42 = 3.5f64;
    var expression_result_4: Float64 = operand_41 + operand_42;

//Test_case_5
    let operand_51: String = "S_1";
    var operand_52 = "S_2";
    var expression_result_5 = operand_51 + operand_52;

//Test_case_6
    let operand_61: String = "S_1";
    var operand_62 = "S_2";
    var expression_result_6: String = operand_61 + operand_62;

    return 0;
}


