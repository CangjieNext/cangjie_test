/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_07_a04_07

  @Level:         1

  @Assertion: 6.1.2.7(4)
              Using ClassName<Type1, Type2, ... , TypeK>(arguments) for defining instances of generic classes.
              The only difference from defining an instance of a non-generic class is that type variables need to be
              instanced for generic classes, i.e., ‘Type1’ to ‘TypeN’ should be given or be inferred.

  @Description: Check that during instantiation of a generic class
                type parameters can not be omitted if constraints
                narrow possible types to two

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006292

*/

open class P {}
class C <: P {}

class A<T> where T <: P {
}

main() {
    A()
    0
}
