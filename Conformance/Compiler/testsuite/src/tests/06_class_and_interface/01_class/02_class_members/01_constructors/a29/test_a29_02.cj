/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a29_02

  @Level:         1

  @Assertion: 6.1.2.1(29)
              The following is an example:
              class Test{
                static let counter: Int64 = 3
                let name: String = "afdoaidfad"
                private Test(
                  name: String, // regular parameter
                  annotation!: String = "nnn", // regular parameter
                  var width!: Int64 = 1, // member variable parameter with initial value
                  length!: Int64, // Error: regular parameters cannot be after member variable parameters
                ) {
                }
              }

  @Description: Check that the full example causes an error

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006196

*/

class Test{
  static let counter: Int64 = 3
  let name: String = "afdoaidfad"
  private Test(
    name: String, // regular parameter
    annotation!: String = "nnn", // regular parameter
    var width!: Int64 = 1, // member variable parameter with initial value
    length!: Int64, // Error: regular parameters cannot be after member variable parameters
  ) {
  }
}

main() {
}