/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_05_a04_01

  @Level:         1

  @Assertion:       5.5(4)
                    let f1: (Int64, Int64)->Int64 = {a: Int64, b: Int64 => a + b} 
                    var f2: () -> Int32 = { => 123 } 
                    let f2={n:Int64 ,_:Int64 =>return n*n}
                    let f3:(Int32 ,Int32 )->Int32 ={n, _=>return n*n}
                    let f4:(String) ->String ={_=>return "Hello" }

  @Description:     Positive examples from spec

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

main() {
    let f0: (Int64, Int64)->Int64 = {a: Int64, b: Int64 => a + b} 
    var f1: () -> Int32 = { => 123 } 
    let f2={n:Int64 ,_:Int64 =>return n*n}
    let f3:(Int32 ,Int32 )->Int32 ={n, _=>return n*n}
    let f4:(String) ->String ={_=>return "Hello" }

    Assert.equals(9, f0(2, 7))
    Assert.equals(123, f1())
    Assert.equals(36, f2(6, 13))
    Assert.equals(9, f2(-3, 4))
    Assert.equals(121, f3(11, 13))
    Assert.equals(100, f3(10, 4))
    Assert.equals("Hello", f4("AAA"))
    Assert.equals("Hello", f4(""))
}
