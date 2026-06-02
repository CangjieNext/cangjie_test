/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_07_01_a07_02

  @Level:         1

  @Assertion:       5.7.1(7) • overloading occurs only between functions of the same name declared by func 
                    declaration, or between constructors within a type.

  @Description:     Check that overloading can be used for struct type definition.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

interface myInterface {}

struct myStruct <: myInterface {
    var myIntVar = 12
    var myBoolVar = true
}

struct myStruct  {
    var myIntVar = 10
    var myBoolVar = false
}

main() {
}
