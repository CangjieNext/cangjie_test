/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_03_a02_04

  @Level:         1

  @Assertion:   7.3(2) 1. The getter function type is ()->T, where T is the type of the property
                and the getter function will be executed when the property is used as an expression.

  @Description: Checks that getter cannot be used for assigning.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       0006124


*/

class A {
  var pvalue: Int32 = 0
  prop val: Int32 {
    get() {
      return pvalue 
    }
  } 
}


main() {
  var x = A()
  x.val = 1
  return 0
}
