/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_02_a02_06

  @Level:         1

  @Assertion:    1.2(2) Among them, the meaning of ; is fixed and indicates the end of an expression
                        or declaration regardless of where it appears, and multiple expressions
                        or declarations separated by ; can be written on the same line.

  @Description:  Check that several nested conditional expressions can't be placed on the same line
                 without separating them by ';'.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

main() {
    let x = 100
    if (x > 0) {print("x is larger than 0")} if (x < 0) {print("x is lesser than 0")} else {print("x equals to 0")}
}
