/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      10_02_04_a03_03

  @Level:         1

  @Assertion: 10.2.4(3)
              The sequence of arguments within the index operator value form [] corresponds to the non-named arguments
              of the operator overload, and can be 1 or more, and can be of any type.

  @Description: Check that mismatching in number of indices in set form of index operator causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

class C {
    operator func[](i1: Int64,  i2: Int64, value!: Int64) {}
}

main() {
    var c = C()
    c[0] = 5
    return
}

