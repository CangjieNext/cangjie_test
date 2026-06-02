/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_01_a07_03

  @Level:         1

  @Assertion: 4.13.1(7) Note that static members of classes, interfaces, and structs can only have type names
              as their access subjects.

  @Description: Check that static members of structs are not allowed to be accessed using instance identifier.

  @Mode: compileonly

  @Negative: yes

*/

struct S {
    static var x = 2
}

main() {
    let s = S()
    let sx = s.x
    return
}

