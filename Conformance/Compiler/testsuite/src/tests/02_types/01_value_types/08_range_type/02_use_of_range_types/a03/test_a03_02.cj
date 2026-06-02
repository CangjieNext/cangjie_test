/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_08_02_a03_02

  @Level:         1
  @Assertion:       2.1.8.2(3) The values of ommited item are determined by the context in which
                    the instance is used: when the operator [] is overloaded on a custom type and
                    its parameter type is Range<Int64>, the value of start equals 0 when start is
                    omitted, and the value of end equals the maximum value of Int64.

  @Description:     Checks the values of range start/end when omitted for overloaded [] operator.

  @Mode:            run
  @Negative:        no
  @Structure:       single

  @Comment:

*/

import utils.assert.Assert

open class A {
    operator func [](range: Range<Int64>): (Int64, Int64) {
      var a: Int64 = -1
      var b: Int64 = -1
      for (el in range) {
        if (a == -1) {
          a = el
        } else {
          b = el
        }
      }  
      return (a, b)
    }
}

main() {
  var maxInt : Int64 = 9223372036854775807
  var a : Int64 = 0
  var b : Int64 = 0
  let x = A()
  (a,b) = x[..=4]
  Assert.equals(0, a)
  (a,b) = x[..5]
  Assert.equals(0, a)
  (a,b) = x[maxInt-10..]
  Assert.equals(maxInt - 1, b)
  (a,b) = x[maxInt-10..=maxInt]
  Assert.equals(maxInt, b)
  return 0
}

