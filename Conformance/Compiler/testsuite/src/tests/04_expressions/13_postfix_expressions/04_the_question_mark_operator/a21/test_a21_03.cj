/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a21_03

  @Level:         1

  @Assertion: 4.13.4(21) For a?[b], a?[b] is mutable only if T is a reference type and T overloads the set form of the
              operator [], otherwise a?[b] is immutable.

  @Description: Check that 'a?[b]' is immutable when T is not a reference type (struct).

  @Mode: compileonly

  @Negative: no

  @Issue: 0006395

*/

struct S {
    S(var x!: Int64) {}

    operator func[](i: Int64, value!: Int64) {}
}

main() {
    var s: ?S = S(x: 3)
    s?[0] = 9
    return
}

