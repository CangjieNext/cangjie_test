
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a04_09

  @Level:         1

  @Assertion:   4.15(4) The operand of - can only be an expression with one kind of numeric type.
  @Description: Checks that UInt64 value cannot be an operand of unary `-`. 
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

main() {
    var v : UInt64 = 1
    let v2 = -v
}
