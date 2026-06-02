
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a14_09

  @Level:         1

  @Assertion:   4.15(14) 1. When the type of the left operand is Int64, the type of the right operand can only be
                UInt64, and the expression is of type Int64.
  @Description: Checks that using binary operator ** with types Int64 and Float16 is not permitted.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
*/

main() {
    let v1 : Int64 = 1
    let v2 : Float16 = 1.0
    let v3 = v1 ** v2
}

