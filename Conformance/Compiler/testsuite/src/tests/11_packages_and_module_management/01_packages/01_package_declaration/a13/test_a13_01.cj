/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_01_a04_01

  @Level:         1

  @Assertion:    11.1.1 The `package` declaration of the same package in different files must be decorated with the same access modifier.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: a.cj 

*/
public package a.a
import utils.assert.Assert

main() {
    Assert.equals("a", packageName())
    return 0
}
