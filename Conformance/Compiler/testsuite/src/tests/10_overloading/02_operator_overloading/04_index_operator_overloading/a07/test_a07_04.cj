/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      10_02_04_a07_04

  @Level:         1

  @Assertion: 10.2.4(7)
              The sequence of arguments inside [] corresponds to the non-named arguments of the operator overload,
              which can be 1 or more, and can be of any type. 

  @Description: Check that passing incorrect number of arguments to a set index operator causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

class C {
    operator func[](index: Int64, value!: Int64) {}
}

main() {
    var c = C()
    c[1, 2] = 3
    return
}

