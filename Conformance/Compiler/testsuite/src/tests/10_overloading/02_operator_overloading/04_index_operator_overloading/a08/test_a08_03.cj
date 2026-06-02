/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      10_02_04_a08_03

  @Level:         1

  @Assertion: 10.2.4(8)
              The expression on the right side of = corresponds to the named parameter overloaded by the operator,
              there is one and only one named parameter, the name of the named parameter must be value, there can
              be no default value, and value can be of any type.

  @Description: Check that set form index operator with another parameter name causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

class C {
    operator func[](index: Int64, v!: Int64) {}
}

main() {}

