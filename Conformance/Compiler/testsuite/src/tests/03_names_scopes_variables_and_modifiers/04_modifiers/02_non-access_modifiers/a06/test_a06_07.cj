/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a06_07

  @Level:         1

  @Assertion:    3.4.2(6) abstract means the class is an abstract class, See class for details

  @Description:  Check that structs cannot have `abstract` modifier.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single
*/

abstract struct S {
    var currentYear = 2023
}

main() {
    return 0
}
