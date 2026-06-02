/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_03_01_a01_03

  @Level:         1

  @Assertion:     5.1.3.1(1) In the Cangjie programming language, variables declared in a function body are called 
                  local variables. 

  @Description:   Check that local variables can't be accessed outside function:
                  access to local variable inside nested function it's definition.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/
func funcParent() {
  func funcNested() {
    var nestedVar = 6
    0
  }
  var parentVar: Int32 = nestedVar
  0
}

main() {
}
