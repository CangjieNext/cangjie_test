/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a04_06

  @Level:         1

  @Assertion:     5.1(4) Following the keyword func, a function name is required.

  @Description:   Check that function declaration w/o function name will produce error: 
                  protected class member function.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/
class myClass {
  myClass(){}
  protected func (){
    "myProtectedFunc"
  }
}
main() {
}
