/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_07_a04_30

  @Level:         1

  @Assertion: 6.1.2.7(4)
              Using ClassName<Type1, Type2, ... , TypeK>(arguments) for defining instances of generic classes.
              The only difference from defining an instance of a non-generic class is that type variables need to be
              instanced for generic classes, i.e., ‘Type1’ to ‘TypeN’ should be given or be inferred.

  @Description: Check that an instance of a generic class can not be created
                if it's impossible to choose between two overloaded constructors
                that are passed an overloaded function name as an argument

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class Parent {}
class Child <: Parent {}

func f(x: Child) {}
func f(x: Parent) {}

class A<T> {
    init(x: (Child) -> Unit, y: Parent) {}
    init(x: (Parent) -> Unit, y: Child) {}
}

main() {
    A<Unit>(f, Parent())
    0
}