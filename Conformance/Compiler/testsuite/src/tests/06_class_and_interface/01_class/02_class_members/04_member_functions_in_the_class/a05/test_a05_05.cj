/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a05_05

  @Level:         1

  @Assertion: 6.1.2.4(5)
              Whenever a instance member function is called,
              it means that a complete object needs to be passed in first,
              so the instance member function is called
              before the object is created is forbidden,
              but the type of the function will not include the implicit parameter.
              The basis for judging the completion of class object creation
              is that the constructor of the class has been called.

  @Description: Check that an instance member generic function without modifiers
                can not be called through the class name

  @Mode: compileonly

  @Negative: yes

  @Structure: single


*/

class Test {
    func f<T>() {}
}

main() {
    Test.f<Unit>()
}