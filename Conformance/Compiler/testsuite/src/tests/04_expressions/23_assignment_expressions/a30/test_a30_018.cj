
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a30_018

  @Level:         1

  @Assertion:   4.23(30) Multi-assignment expressions are a special kind of assignment expressions. The left side of
                the equals sign of a multi-assignment expression must be a tuple, the elements inside this tuple must
                be left-valued, the expression on the right side of the equals sign must also be of tuple type, and the
                type of each element of the right tuple must be a subtype of the left-valued type of the corresponding
                position.
  @Description: Check that 'a?[b]' cannot be in the left part of multi-assignment if reference type T does not
                overload the set form of the operator [].
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

class C {
    var x = 1

    operator func [](y : Int64) { x }
}

main() {
    var c: ?C = C()
    (c?[0], _) = (1, 1)
}
