/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_a03_004

  @Level:         1

  @Assertion:    2(3) Static typing and strong typing facilitate programmers to discover 
                 program errors at compile time.

  @Description:  Checks that attempt to assign a expression, calculating a value of type Int32,
                 to a variable of type Int8 results in a compilation error.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:  

*/

main() {
    let operand_01: Int32 = 100;
    var operand_02 = 200i32;
    var expressionResult: Int8 = operand_01 + operand_02;
    return 0;
}


