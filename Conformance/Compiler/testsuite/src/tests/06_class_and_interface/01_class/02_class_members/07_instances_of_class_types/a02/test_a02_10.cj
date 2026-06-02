/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_07_a02_10

  @Level:         1

  @Assertion: 6.1.2.7(2)
              Using ClassName(arguments) for defining instances of classes that are not generic.
              In above, ClassName is the name of the class, and arguments is the list of argument.
              ClassName(arguments) will invoke the closest matching constructor
              (based on the rules in section Function Overloading),
              and then generate an instance of ClassName.

  @Description: Check that an instance of a non-generic class can not be created
                if there's no matching constructor:
                the invocation passes more arguments than defined in the constructor

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {
    init(x: Int64, y: String) {}
}

main() {
    A(1, "", ())
    0
}