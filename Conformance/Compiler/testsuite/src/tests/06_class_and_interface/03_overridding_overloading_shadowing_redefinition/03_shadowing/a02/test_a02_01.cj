/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_03_a02_01

  @Level:         1

  @Assertion: 6.3.3(2)
              In the following example,
              the classes C1 and C2 both have the same name instance variable x,
              and the compilation reports an error.
              open class C1 {
                let x = 1
              }
              class C2 <: C1 {
                let x = 2 // error
              }

  @Description: Check that an error is correctly produced

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class C1 {
    let x = 1
}
class C2 <: C1 {
    let x = 2 // error
}

main() {
}