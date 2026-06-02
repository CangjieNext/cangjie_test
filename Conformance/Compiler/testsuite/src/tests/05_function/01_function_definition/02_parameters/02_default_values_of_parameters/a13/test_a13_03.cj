/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a13_03

  @Level:         1

  @Assertion:     5.1.2.2(13) The default value of a function parameter can reference the formal parameter defined 
                  before the parameter.
  
  @Description:   Check that default value of a function parameter can reference the formal parameter defined 
                  after the parameter: class static function

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

class myClass {

  static func myClassStaticFunc(b!: Int32 = c, c!: Int32) {
    b + c
  }
}

main() {
}
