/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      04_03_a16_02

  @Level:         1

  @Assertion: 4.3(16) When the context does require a specific type, then both
              branches of the if expression must be a subtype of the specific
              type required by the context.
  @Description: Checks that compile errors occurs when the context requires a
                specific type, and if-expression branch type is not a subtype 
                of the type required by the context. Tests Int32 and Int64
                branches for Int64 context type.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: ignore

*/

var x = 0

main() {
    var res: Int64 =
        if (x == 0) {
            0
        } else {
            1_i32
        }

    return
}
