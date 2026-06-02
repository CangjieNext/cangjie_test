/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_03_01_a03_03

  @Level:         1

  @Assertion:     5.3.1(3) The syntax of named arguments can only be used when the name of corresponding parameters 
                  are followed by the symbol ! in the function definition, otherwise the syntax of named arguments 
                  cannot be used. 

  @Description:   Check that function without named parameters can't be invoked with binded by names parameters.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

enum myEnum {
  A | B 

  func f0(a: String, b: Rune, c: Bool, d: Int32): String {
    if(c){
      if(d < 0) {
        return "${a}"
      }
      return "${b}"
    }else{
      if(d > 0) {
        return "${a} ${b}"
      }
      return "${b} ${a}"
    }
  }
}

main() {
  var myVar = myEnum.A.f0("D$D%D", 'y', c: true, d: 1)
}
