/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_01_a04_02

  @Level:         1

  @Assertion:    3.1(4) Entities in different scopes may have the same name.

  @Description:  Check that entities with the same name in the same scope cause an error.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

main(): Unit {
    { =>
      let x = 0xb6
      func x() {}
    }
}