/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_a01_305

  @Level:         1

  @Assertion:    2(1) The Cangjie Programming Language is a statically typed language, 
                 i.e. type checking for ensuring safety is mostly performed at compile time.

  @Description:  Checks that the attempts to assign a value:
                 -  of type Int32 to another variable declared without type does not cause compilation error;
                 -  of type Int64 to another variable declared with the same type does not cause compilation error;
                 -  of type Float32 to another variable declared without type does not cause compilation error;
                 -  of type Float64 to another variable declared with the same type does not cause compilation error;
                 -  of type class to another variable declared without type does not cause compilation error;
                 -  of type class to another variable declared with the same type does not cause compilation error;

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

  @Comment:  

*/

class TestClass {};

main() {
//Test_case_1
    let sourceVar_01: Int32 = 1;
    var targetVar_01 = sourceVar_01;

//Test_case_2
    let sourceVar_02: Int64 = 2;
    let targetVar_02: Int64 = sourceVar_02;

//Test_case_3
    let sourceVar_03: Float32 = 1.5;
    let targetVar_03 = sourceVar_03;

//Test_case_4
    let sourceVar_04: Float64 = 2.5;
    let targetVar_04: Float64 = sourceVar_04;

//Test_case_5
    let sourceVar_05: TestClass = TestClass();
    let targetVar_05 = sourceVar_05;

//Test_case_6
    let sourceVar_06: TestClass = TestClass();
    let targetVar_06: TestClass = sourceVar_06;

    return 0;
}

