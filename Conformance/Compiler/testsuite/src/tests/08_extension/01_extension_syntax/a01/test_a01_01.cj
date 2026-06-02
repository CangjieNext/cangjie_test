/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_a01_01

  @Level:         1

  @Assertion:   8.1(1) A simple example of an extension is as follows.
                extend String {
                  func printSize() {
                    print(this.size)
                  }
                }
                "123".printSize() // 3

  @Description: Checks that example works as expected.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       


*/

import utils.assert.Assert

extend String {
  func printSize() {
    this.size
  }
}

main() {
  Assert.equals(3, "123".printSize())
  return 0;
}


