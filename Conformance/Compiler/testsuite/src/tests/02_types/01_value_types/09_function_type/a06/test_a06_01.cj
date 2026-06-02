/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_09_a06_01

  @Level:         1

  @Assertion:  2.1.9(6) In the Cangjie programming language, functions are first-class citizens. 
                        This means functions can be used as arguments of other functions, 
                        and can be used as return values to other functions, 
                        and can be assigned directly to variables.

  @Description: Checks that:
                - when function is used as argument of other function no compilation error;
                - when function is used as return value to other function no compilation error;
                - when function is assigned directly to variable no compilation error;

  @Mode:        compileonly
  @Negative:    no
  @Structure:   single

*/

type funcType1 = () -> Int32;
type funcType2 = (() -> Int32) -> Int32;
type funcType3 = () -> () -> Int32;

func testFunc1(): Int32 {
    return 1i32;
}

func testFunc2(funcPar: () -> Int32): Int32 {
    return 1;
}

func testFunc3(): () -> Int32 {
    return testFunc1;
}

main() {
    let result1 = testFunc2(testFunc1);
    let result2 = testFunc3();
    let funcVar1: funcType1 = testFunc1;
    var funcVar2: funcType2 = testFunc2;
    let funcVar3: funcType3 = testFunc3;

    return 0;
}

