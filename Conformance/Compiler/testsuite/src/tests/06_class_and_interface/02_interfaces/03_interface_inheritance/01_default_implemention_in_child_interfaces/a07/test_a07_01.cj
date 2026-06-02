/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_03_01_a07_01

  @Level:         1

  @Assertion: 6.2.3.1(7)
              interface I1 {
                func f() {}
              }
              interface I2 {
                func f() {}
              }
              interface I3 <: I1 & I2 {} // error, I3 must implement f: () -> Unit

  @Description: Check that the example produces an error

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface I1 {
    func f() {}
}
interface I2 {
    func f() {}
}
interface I3 <: I1 & I2 {} // error, I3 must implement f: () -> Unit

main() {
}