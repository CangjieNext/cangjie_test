/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_05_a01_01

  @Level:         1

  @Assertion:       5.5(1) A Lambda expression is an expression that represents an anonymous function. 

  @Description:     Check that is possible to define anonymous functions and use it.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

class myClass {
    let f0: (Int64, Int64) -> Int64 = {a: Int64, b: Int64 => a + b } 
    var f1: () -> Int32 = { => 46 } 
    let f2 = { y: Int64 , _: Int64 => return y*y }
    let f3: (Int32, Int32 ) -> Int32 = { x, _ => return x*x }
    let f4: (String) -> String = { _ => return "Hello" }

    public func checkLambda() {
        Assert.equals(9, f0(2, 7))
        Assert.equals(46, f1())
        Assert.equals(36, f2(6, 13))
        Assert.equals(9, f2(-3, 4))
        Assert.equals(121, f3(11, 13))
        Assert.equals(100, f3(10, 4))
        Assert.equals("Hello", f4("AAA"))
        Assert.equals("Hello", f4(""))
    }
}

struct myStruct {
    let f0: (Int64, Int64) -> Int64 = {a: Int64, b: Int64 => a + b } 
    var f1: () -> Int32 = { => 46 } 
    let f2 = { y: Int64 , _: Int64 => return y*y }
    let f3: (Int32, Int32 ) -> Int32 = { x, _ => return x*x }
    let f4: (String) -> String = { _ => return "Hello" }

    public func checkLambda() {
        Assert.equals(9, f0(2, 7))
        Assert.equals(46, f1())
        Assert.equals(36, f2(6, 13))
        Assert.equals(9, f2(-3, 4))
        Assert.equals(121, f3(11, 13))
        Assert.equals(100, f3(10, 4))
        Assert.equals("Hello", f4("AAA"))
        Assert.equals("Hello", f4(""))
    }
}

enum myEnum {
    F

    public func checkLambda() {
        let f0: (Int64, Int64) -> Int64 = {a: Int64, b: Int64 => a + b } 
        var f1: () -> Int32 = { => 46 } 
        let f2 = { y: Int64 , _: Int64 => return y*y }
        let f3: (Int32, Int32 ) -> Int32 = { x, _ => return x*x }
        let f4: (String) -> String = { _ => return "Hello" }

        Assert.equals(9, f0(2, 7))
        Assert.equals(46, f1())
        Assert.equals(36, f2(6, 13))
        Assert.equals(9, f2(-3, 4))
        Assert.equals(121, f3(11, 13))
        Assert.equals(100, f3(10, 4))
        Assert.equals("Hello", f4("AAA"))
        Assert.equals("Hello", f4(""))
    }
}

let f0: (Int64, Int64)->Int64 = {a: Int64, b: Int64 => a + b} 
var f1: () -> Int32 = { => 46} 
let f2={n:Int64 ,_:Int64 =>return n*n}
let f3:(Int32 ,Int32 )->Int32 ={n, _=>return n*n}
let f4:(String) ->String ={_=>return "Hello" }

main() {

    Assert.equals(9, {a: Int64, b: Int64 => a + b}(2, 7))
    Assert.equals(9, {n: Int64 , _: Int64 => return n*n }(-3, 4))
    Assert.equals(16, { n: Int32, _: Float16 => return n*n }(4, 8.0))
    Assert.equals("Hello", { _: String => return "Hello" }("erl"))

    Assert.equals(9, f0(2, 7))
    Assert.equals(46, f1())
    Assert.equals(36, f2(6, 13))
    Assert.equals(9, f2(-3, 4))
    Assert.equals(121, f3(11, 13))
    Assert.equals(100, f3(10, 4))
    Assert.equals("Hello", f4("AAA"))
    Assert.equals("Hello", f4(""))

    var myClassImpl = myClass()
    myClassImpl.checkLambda()

    var myStructImpl = myStruct()
    myStructImpl.checkLambda()

    myEnum.F.checkLambda()
}
