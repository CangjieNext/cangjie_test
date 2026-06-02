/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_01_a03_03

  @Level:         1

  @Assertion:    13.1.2.1(3)  @C supports only modifying foreign functions,
                 non-generic functions and struct types in the top-level scope.


  @Description:  '@c' with struct type.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

  @Comment:      

  @Issue: 0006421
*/

@C
struct ABC {
  var x : Int32
  var y : Int32
  init(x : Int32, y : Int32) {
    this.x = x
    this.y = y
  }
}

main() {
    var Value : ABC = ABC(11, 666);
}