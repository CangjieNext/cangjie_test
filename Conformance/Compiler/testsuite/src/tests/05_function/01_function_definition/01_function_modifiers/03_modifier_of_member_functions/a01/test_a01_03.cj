/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_01_03_a01_03

  @Level:         1

  @Assertion:     5.1.1.3(1) Class member functions can have the following modifiers: public, protected, private, 
                  static, open, override and redef. For details, see Class Members.

  @Description:   Check that class member function definition can't use override function modifiers if there is no 
                  corresponding open function with the same name and signature in its supertype.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

class myClass {
  override func myClassFunc(inVal: Int64) { inVal*2 }
}

main() {
}
