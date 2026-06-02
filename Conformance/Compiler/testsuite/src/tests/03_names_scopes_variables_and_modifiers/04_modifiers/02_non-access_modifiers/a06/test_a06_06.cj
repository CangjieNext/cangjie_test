/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a06_06

  @Level:         1

  @Assertion:    3.4.2(6) abstract means the class is an abstract class, See class for details

  @Description:  Check that private functions cannot be declared in an abstract class.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single
*/

abstract class C1 {
    private func foo(): String
}

main() {
    return 0
}
