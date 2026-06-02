/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_a03_11

  @Level:         1

  @Assertion: 6.1.1(3)
              Classes can be only defined at the top level of a file.

  @Description: Check that a class can not be defined inside a match expression

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

func foo(a : Int32) : Bool {
  var res : Bool = match(a) {
    case 0 => false
    case 1 => true
    case _ =>  class CaseDeclaration { var x = false }
               let c = CaseDeclaration(); c.x
  }
  return res
}

main() {
}
