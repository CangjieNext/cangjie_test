/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a01_01

  @Level:         1

  @Assertion:    1.4(01) 1.4(1) The following table lists all the operators supported by Cangjie 
                 (the closer an operator is to the top of the table, the higher precedence it has).
                  Refer to Chapter 4 Expressions for a detailed description of each operator.
                  Operator Description

  @Description:  Emit error as assign have wrong token (Algol,Pascal...)

  @Mode:         compileonly

  @Negative:     yes

  @Comment:      In this chart negative tests with non existed operators.
                 Proper operators are represented in other parts

  @Structure:    single

*/


main() {
    var wid: Int32 = 0
    var len: Int32 = 1
    wid := len
}
