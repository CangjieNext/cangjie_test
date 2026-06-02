/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a13_01

  @Level:         1

  @Assertion:     5.1.2.2(13) The default value of a function parameter can reference the formal parameter defined 
                  before the parameter.
  
  @Description:   Check that default value of a function parameter can reference the formal parameter defined 
                  before the parameter.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

func add(a: String, b!: String = a): String { "${a}  ${b}" } 

class myClass {

  static func myClassStaticFunc(b: String, c!: String = b) {
    "${c}  ${b}"
  }

  func myClassFunc(a: String, b: String, c!: String = b) {
    "${a} ${c} ${b}"
  }
}

struct myStruct {

  static func myStructStaticFunc(b: String, c!: String = b) {
    "${b}${c}"
  }

  func myStructFunc(a: String, b: String, c!: String = b) {
    "${a} ${c} ${b}"
  }
}

enum myEnum {

  E

  func myEnumFunc(a: String, b: String, c!: String = b) {
    "${c} ${b} ${a}"
  }

}

main() {
  
  Assert.equals("def  def", add("def"))
  Assert.equals("gji8  90jq3", add("gji8", b: "90jq3"))

  Assert.equals("TyU6  TyU6", myClass.myClassStaticFunc("TyU6"))
  Assert.equals("Ui75  H7%", myClass.myClassStaticFunc("H7%", c: "Ui75"))

  var myClassImpl = myClass()
  Assert.equals("FFF g g", myClassImpl.myClassFunc("FFF", "g"))
  Assert.equals("6 4 7", myClassImpl.myClassFunc("6", "7", c: "4"))

  Assert.equals("FgbFgb", myStruct.myStructStaticFunc("Fgb"))
  Assert.equals("E&%$#=)))", myStruct.myStructStaticFunc("E&%$#", c: "=)))"))

  var myStructImpl = myStruct()
  Assert.equals("4 TTT TTT", myStructImpl.myStructFunc("4", "TTT"))
  Assert.equals("RRRRR %&^)( s r", myStructImpl.myStructFunc("RRRRR", "s r", c: "%&^)("))

  Assert.equals("7 7 @$%", myEnum.E.myEnumFunc("@$%", "7"))
  Assert.equals("StD 7 ttt", myEnum.E.myEnumFunc("ttt", "7", c: "StD"))
}
