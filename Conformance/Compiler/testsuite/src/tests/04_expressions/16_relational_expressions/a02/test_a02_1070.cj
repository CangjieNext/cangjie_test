
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_16_a02_1070

  @Level:         1

  @Assertion:   4.16(2) All relational operators are binary operators which requires two operands have the same type.
  @Description: Checks that using binary operator == with types Bool and Int16 is not permitted.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

main() {
    var v1 : Bool = true
    var v2 : Int16 = 1
    let v3 = v1 == v2
}
