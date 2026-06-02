
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a33_01

  @Level:         1

  @Assertion:   4.23(33)
                main() :Int64 {
                    var a:Int64
                    var b:Int64

                    (a, b)=(1,2) // a == 1, b == 2
                    (a, b)=(b, a) // swap, a == 2, b == 1
                    (a, _)=(3,4) // a == 3
                    (_,_)=(5,6) // no assignment

                    return 0
                }
  @Description: Checks the given example.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

import utils.assert.Assert

main(): Int64 {
    var a:Int64
    var b:Int64

    (a, b)=(1,2) // a == 1, b == 2
    Assert.equals(1, a)
    Assert.equals(2, b)
    (a, b)=(b, a) // swap, a == 2, b == 1
    Assert.equals(2, a)
    Assert.equals(1, b)
    (a, _)=(3,4) // a == 3
    Assert.equals(3, a)
    Assert.equals(1, b)
    (_,_)=(5,6) // no assignment
    Assert.equals(3, a)
    Assert.equals(1, b)
    
    return 0
}