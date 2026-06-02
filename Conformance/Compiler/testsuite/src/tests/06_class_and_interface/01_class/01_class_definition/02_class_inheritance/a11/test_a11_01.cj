/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a11_01

  @Level:         1

  @Assertion: 6.1.1.2(11)
              It is not allowed to inherit multiple classes, as shown in the following example.
              open class C1 {}
              open class C2 {}
              class C3 <: C1 & C2 {} // Error: Multiple inheritance is not supported

  @Description: Check that the example produces an error.

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class C1 {}
open class C2 {}
class C3 <: C1 & C2 {} // Error: Multiple inheritance is not supported

main() {
}
