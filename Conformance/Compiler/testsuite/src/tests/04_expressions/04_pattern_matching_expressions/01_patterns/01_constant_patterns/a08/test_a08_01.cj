/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_01_a08_01

  @Level:         1

  @Assertion: 4.4.1.1(8) for example:
              func unhex(c: Byte): Byte {
                  match {
                      case b'0' <= c && c <= b'9' => c - b'0'
                      case b'a' <= c && c <= b'f' => c - b'a' + 10
                      case b'A' <= c && c <= b'F' => c - b'A' + 10
                      case _ => 0
                  }
              }

  @Description: Checks the positive example above from the specification.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

func unhex(c: Byte): Byte {
    match {
        case b'0' <= c && c <= b'9' => c - b'0'
        case b'a' <= c && c <= b'f' => c - b'a' + 10
        case b'A' <= c && c <= b'F' => c - b'A' + 10
        case _ => 0
    }
}


main() {
    let c1: Byte = b'0'
    Assert.equals(0, unhex(c1))
    let c2: Byte = b'a'
    Assert.equals(10, unhex(c2))
    let c3: Byte = b'A'
    Assert.equals(10, unhex(c3))
    return
}
