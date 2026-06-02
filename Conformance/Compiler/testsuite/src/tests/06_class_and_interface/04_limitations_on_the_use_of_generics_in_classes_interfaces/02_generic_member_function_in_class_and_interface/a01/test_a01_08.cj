/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_04_02_a01_08

  @Level:         1

  @Assertion: 6.4.2(1)
              In Cangjie programming language, nonstatic abstract functions and open functions
              in classes and interfaces are allowed to declare generic parameters

  @Description: Check that an open function in an abstract class can be generic

  @Mode: run

  @Negative: no

  @Structure: single

*/

abstract class A {
    public open func f<T>() {}
}

main() {
}