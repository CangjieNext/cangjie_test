/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_a05_05

  @Level:         1

  @Assertion:   8.1(5) The definition of the extension body does not allow the omission of {}.

  @Description: Checks that interface extension with generic constrains without body is not allowed.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       


*/

interface I2<T> {
    func fi2(a: T): T
}

class B<T> where T <: Countable<T> {
}

extend B<T> <: I2<T> where T <: Countable<T>

main() {
}
