/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_a08_01

  @Level:         1

  @Assertion:   14.1(8)   When a newline character is used as the separator of two expressions,
                it is not ignored and parsed as a quoteToken. 

  @Description: Check that if newline character is used as the separator of two expressions,
                it is not ignored
  
  @Mode:        run

  @Negative:    no

*/

import utils.assert.Assert
import std.ast.*

main(): Unit {
    var ms = quote(multi-line
            string)

    var foo = quote(public func boo() {
                      var r = false
                      return r
                    })
    
    var mv = quote(var v =
                  2 +
                  3 *
                  8)

    Assert.equals(1, ms.toString().count("\n"))
    Assert.equals(3, foo.toString().count("\n"))
    Assert.equals(3, mv.toString().count("\n"))
}
