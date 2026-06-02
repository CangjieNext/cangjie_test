/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_05_a06_01

  @Level:         1

  @Assertion:       5.5(6) • If the context explicitly specifies a return type for the lambda expression, then the 
                    return type of the lambda expression is the one specified by the context. 

  @Description:     Check that return type of lambda expression can be infern from context.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

class myClass {
    let myLambda0: (Int64, Int64)->Int64 = {a: Int64, b: Int64 => a + b} 
    var myLambda1: () -> Int32 = { => 123 } 
    var myLambda2: () -> Float32 = { => 123.0 } 

    func myFunc() {
        Assert.isTrue(myLambda0 is (Int64, Int64)->Int64)
        Assert.isTrue(myLambda1 is ()->Int32)
        Assert.isTrue(myLambda2 is ()->Float32)

        Assert.equals(9, myLambda0(2, 7))
        Assert.equals(123, myLambda1())
    }
}

struct myStruct {
    let myLambda0: (Int64, Int64)->Int64 = {a: Int64, b: Int64 => a + b} 
    var myLambda1: () -> Int32 = { => 123 } 
    var myLambda2: () -> Float32 = { => 123.0 } 

    func myFunc() {
        Assert.isTrue(myLambda0 is (Int64, Int64)->Int64)
        Assert.isTrue(myLambda1 is ()->Int32)
        Assert.isTrue(myLambda2 is ()->Float32)

        Assert.equals(9, myLambda0(2, 7))
        Assert.equals(123, myLambda1())
    }
}

enum myEnum {
    G

    func myFunc() {
        let myLambda0: (Int64, Int64)->Int64 = {a: Int64, b: Int64 => a + b} 
        var myLambda1: () -> Int32 = { => 123 } 
        var myLambda2: () -> Float32 = { => 123.0 } 

        Assert.isTrue(myLambda0 is (Int64, Int64)->Int64)
        Assert.isTrue(myLambda1 is ()->Int32)
        Assert.isTrue(myLambda2 is ()->Float32)

        Assert.equals(9, myLambda0(2, 7))
        Assert.equals(123, myLambda1())
    }
}

main() {
    let myLambda0: (Int64, Int64)->Int64 = {a: Int64, b: Int64 => a + b} 
    var myLambda1: () -> Int32 = { => 123 } 
    var myLambda2: () -> Float32 = { => 123.0 } 

    Assert.isTrue(myLambda0 is (Int64, Int64)->Int64)
    Assert.isTrue(myLambda1 is ()->Int32)
    Assert.isTrue(myLambda2 is ()->Float32)

    Assert.equals(9, myLambda0(2, 7))
    Assert.equals(123, myLambda1())

    var myClassImpl = myClass()
    myClassImpl.myFunc()

    var myStructImpl = myStruct()
    myStructImpl.myFunc()

    myEnum.G.myFunc()
}
