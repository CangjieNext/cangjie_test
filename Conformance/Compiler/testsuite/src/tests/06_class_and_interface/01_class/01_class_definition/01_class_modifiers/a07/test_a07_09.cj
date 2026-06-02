/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_01_a07_09

  @Level:         1

  @Assertion: 6.1.1.1(7)
              abstract: This class is an abstract class.
              Unlike a common class, an abstract class can define common functions and declare abstract functions.
              Only the class modified by this modifier is an abstract class.
              If a function has no body, we call it an abstract function

  @Description: Check that an open public class can not declare abstract functions

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open public class TestA0709 {
  public func f(): Unit
  let v = 1
  let b = ""
}

main() {
}
