/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a60_10

  @Level:         1

  @Assertion: 6.1.2.1(60)
              The compiler analyzes the dependency between all constructors.
              If a cyclic invoking is performed, an error is reported.

  @Description: Check that a cyclic dependency through member variables initialization
                causes an error

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006228

  @Comment: The assertion is a part of the list of rules of using constructors, this and super.
            It says the compiler analyzes dependencies between 'all' constructors.
            But the intention here might be 'all constructors called on the same instance', i.e through 'this'.
            So depending on the resolution of issue 6228 these tests might be removed.

*/

class BinaryTree {
    var left = BinaryTree()
    var right = BinaryTree()
}

main() {
}