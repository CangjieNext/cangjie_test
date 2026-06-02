/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      04_03_a16_05

  @Level:         1

  @Assertion: 4.3(16) When the context does require a specific type, then both
              branches of the if expression must be a subtype of the specific
              type required by the context.
  @Description: Checks that compile errors occurs when the context requires a
                specific type, and if-expression branch type is not a subtype 
                of the type required by the context. Tests C1 and C instances,
                C1 inherits C, context type is C1.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: ignore

*/

var x = 0

open class C {}
open class C1 <: C {}

main() {
    var res: C1 =
        if (x == 0) {
            C1()
        } else {
            C()
        }

    return
}
