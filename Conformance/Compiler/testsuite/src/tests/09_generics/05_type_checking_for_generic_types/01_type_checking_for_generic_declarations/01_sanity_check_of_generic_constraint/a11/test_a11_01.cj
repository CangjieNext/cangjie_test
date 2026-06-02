/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_05_01_01_a11_01

  @Level:         1

  @Assertion: 9.5.1.1(11) For example, T <: Int32 & Bool is illegal.

  @Description: Check the example provided.

  @Mode: compileonly

  @Negative: yes

*/

class GenericClass<T> where T <: Int32 & Bool {}

main() {}

