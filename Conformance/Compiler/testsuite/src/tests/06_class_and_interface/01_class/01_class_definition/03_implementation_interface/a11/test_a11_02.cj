/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_03_a11_02

  @Level:         1

  @Assertion: 6.1.1.3(11)
              when generic class C3 defined above is applied to a type argument Int32, 
              as a result, the two implemented interfaces are actually of the same type, 
              Cangjie compiler will emit an error:
              interface I1<T> {}
              open class C3<T> <: I1<T> & I1<Int32> {} // ok
              var a: C3<Int32> // error
              var b = C3<Int32>() // error
              class C4 <: C3<Int32> {}// error

  @Description: Check the first negative case from the example.

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006134

  @Comment: The error here is caused by a different reason. The global variables must be initialized on declaration.

*/

interface I1<T> {}
open class C3<T> <: I1<T> & I1<Int32> {} // ok
var a: C3<Int32> // error

main() {
}
