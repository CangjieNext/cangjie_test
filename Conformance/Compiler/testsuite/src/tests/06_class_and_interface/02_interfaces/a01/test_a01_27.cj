/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_a01_27

  @Level:         1

  @Assertion: 6.2(1)
              An interface is used to define an abstract type that contains no data,
              but can define the behavior of the type.

  @Description: Check that a generic interface can not contain an instance mutable variable

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface I<T> {
    var x = 1
}

main() {
}