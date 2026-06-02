/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_02_a01_03

  @Level:         1

  @Assertion:    1.2(1) There are two symbols that can indicate the end of an expression or declaration:
                        a semicolon (;) or a newline character.

  @Description:  Check if the newline character is not used as separator for the function and variable declaration.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

main() {
    func add(p1: Int64, p2: Int64) {p1 + p2} let intNum: Int64 = 100
}
