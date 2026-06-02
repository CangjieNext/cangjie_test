/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a21_02

  @Level:         1

  @Assertion: 4.13.4(21) For a?[b], a?[b] is mutable only if T is a reference type and T overloads the set form of the
              operator [], otherwise a?[b] is immutable.

  @Description: Check that 'a?[b]' is immutable if reference type T does not overload the set form of the operator [].

  @Mode: compileonly

  @Negative: yes

*/

class C {
    init() {
        x = 0
    }

    var x: Int64
}

main() {
    var c: ?C = C()
    c?[0] = 9
    return
}

