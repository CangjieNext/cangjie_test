/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        11_01_05_01_a08_009

  @Level:         1

  @Assertion:   11.1.5.1(8) If a unique main method is found, the compiler will 
                further check its parameter and return value type. The main can have
                no parameter or parameter of type Array<String> and return value of type
                Unit or integer.

  @Description: Check that main method can have return value of type UInt16.

  @Mode:        compileonly

  @Negative:    no

  @Structure:   single

*/

main() {
    var i : UInt16 = 0
    return i  
}

