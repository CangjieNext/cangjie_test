/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_03_a02_01

  @Level:         1

  @Assertion:       5.3.3(2)
                    func f(a: Int64, fn: (Int64)->Int64) { fn(a) } 
                    f(1, { i => i * i }) // normal function call 
                    f(1) { i => i * i } // trailing lambda  

  @Description:     Positive examples from spec

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

func f(a: Int64, fn: (Int64)->Int64) { fn(a) } 

main() {
    var a = f(1, { i => i * i }) // normal function call
    Assert.equals(1, a)
    Assert.isTrue(f is (Int64, (Int64)->Int64) -> Int64)
    a = f(1) { i => i * i } // trailing lambda
    Assert.equals(1, a)
}
