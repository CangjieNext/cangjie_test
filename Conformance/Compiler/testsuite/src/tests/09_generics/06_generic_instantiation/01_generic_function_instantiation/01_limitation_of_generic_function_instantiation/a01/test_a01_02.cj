/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_06_01_01_a01_02

  @Level:         1

  @Assertion: 9.6.1.1(1) Since Cangjie implements generic function by instantiation, generic type parameters cannot be 
              declarared in the following situations: 
              1. Non static abstract functions in interfaces and abstract classes. 
              2. Functions with open modifier in classes. 
              3. Operator overloading functions.

  @Description: Check that non static abstract functions in abstract classes can not be generic.

  @Mode: run

  @Negative: no

*/

abstract class C {
    public func f<T>(x: T): T
}

main() {}

