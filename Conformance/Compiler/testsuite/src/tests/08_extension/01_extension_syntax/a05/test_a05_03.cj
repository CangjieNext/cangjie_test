/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_a05_03

  @Level:         1

  @Assertion:   8.1(5) The definition of the extension body does not allow the omission of {}.

  @Description: Checks that interface extension without body is not allowed.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       


*/

interface I1 {
    func fi1(): Int64
}

class A {
}

extend A <: I1

main() {
}
