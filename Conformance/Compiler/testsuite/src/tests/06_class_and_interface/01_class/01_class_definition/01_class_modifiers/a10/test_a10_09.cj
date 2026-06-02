/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_01_a10_09

  @Level:         1

  @Assertion: 6.1.1.1(10)
              An abstract class cannot be instantiated.

  @Description: Check that an empty generic public abstract class can not be instantiated

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

public abstract class TestA1009<T, U> {}

main() {
  var x = TestA1009<Bool, Bool>()
}
