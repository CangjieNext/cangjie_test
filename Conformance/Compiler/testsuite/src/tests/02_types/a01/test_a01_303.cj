/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_a01_303

  @Level:         1

  @Assertion:    2(1) The Cangjie Programming Language is a statically typed language, 
                 i.e. type checking for ensuring safety is mostly performed at compile time.

  @Description:  Test for conformity of Function types.
                 Checks that attempt to call function with parameter Function type 
                 when passed parameter (function) does not match type of parameter
                 of called function results in a compilation error.
                 Passed parameter (function) has type of returned value different from 
                 returned value in declared Function type.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:  

*/

type func_type = () -> Int32;

func called_func(function: func_type): Int32 { return function() };

func func_as_parameter(): Int16{ return 1; }

main() {
    called_func(func_as_parameter);
    return 0;
}

