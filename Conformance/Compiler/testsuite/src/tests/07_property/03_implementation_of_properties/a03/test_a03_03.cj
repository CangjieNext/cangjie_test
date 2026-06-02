/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_03_a03_03

  @Level:         1

  @Assertion:   7.3(3) 2. The setter function is of type (T)->Unit, where T is the type of the
                property and the name of the formal parameter needs to be explicitly specified,
                and the setter function will be executed when the property is assigned a value.

  @Description: Checks that setter function return value can be type other than Unit, compiler will insert return unit.

  @Mode:        compileonly
  @Negative:    no
  @Structure:   single
  @Issue:       0006124, 0006181


*/

class A {
  static public var str: String = ""
  mut prop val: String {
    get() {
      str += "g"
      ""
    }
    set(v) {
      str += "s"
      ""
    }
  } 
}


main() {
  return 0
}
