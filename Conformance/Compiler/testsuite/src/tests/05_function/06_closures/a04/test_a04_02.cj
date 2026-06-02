/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 05_06_a04_02

  @Level:         1

  @Assertion: 5.6(4) Variables can be captured in the following scenarios:

              * Capturing variables declared by let: The values of these variables cannot be modified in closures.

  @Description: Check that variable declared by let can not be modified in closures.

  @Mode: compileonly

  @Negative: yes
*/

main() {
    let x = 2

    func foo() {
        x = 5
        x * 3
    }
}

