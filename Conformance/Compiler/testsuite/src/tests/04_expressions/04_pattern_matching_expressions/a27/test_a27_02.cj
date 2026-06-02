/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a27_02

  @Level:         1

  @Assertion: 4.4(27)  When the context does require a specific type, then all cases of the match expression must be a
              subtype of the specific type required by the context

  @Description: Checks that the compiler error is prodused if the match expression is not the subtype of the specific
                type required by the context
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

var r = 0

open class A {}
class B <: A {}
class C <: A {}

main() {
    var m1: B = match (r) {
        case 0 => A()
        case 1 => B()
        case _ => C()
    }

    return
}
