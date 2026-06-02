/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      06_01_01_01_a06_11

  @Level:         1

  @Assertion: 6.1.1.1(6)
              Non-abstract classes without open or sealed modifiers cannot be inherited.

  @Description: Check that a generic class derived from a sealed class can not be inherited.

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

sealed class InheritableClass {}

class DerivedGenericClass<T> <: InheritableClass {}

class ChildCandidate <: DerivedGenericClass<Int32> {}

main() {
    var x = ChildCandidate()
}
