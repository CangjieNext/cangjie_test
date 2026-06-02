
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a30_014

  @Level:         1

  @Assertion:   4.23(30) Multi-assignment expressions are a special kind of assignment expressions. The left side of
                the equals sign of a multi-assignment expression must be a tuple, the elements inside this tuple must
                be left-valued, the expression on the right side of the equals sign must also be of tuple type, and the
                type of each element of the right tuple must be a subtype of the left-valued type of the corresponding
                position.
  @Description: Check that immutable optional chaining expression cannot be in the left part of multi-assignment.
                Check case 'a?[b] = e2'.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6522

*/

class C { }

main() {
    var t: (C, C, C) = (C(), C(), C())
    (t?[1], _) = (C(), 1)
}
