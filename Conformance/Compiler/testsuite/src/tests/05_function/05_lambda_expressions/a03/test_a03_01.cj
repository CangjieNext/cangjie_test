/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_05_a03_01

  @Level:         1

  @Assertion:       5.5(3) There are two forms of lambda expressions, {a: Int64 => e1; e2 } with a formal parameter 
                    and { => e1; e2 } without a formal parameter (e1 and e2 are expressions or sequences of 
                    declarations)

  @Description:     Check that lambda expression can be defined according specifyed rules.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

class myClass {
    let myLambda0: (Int64, Int64)->Int64 = {a: Int64, b: Int64 => a + b} 
    var myLambda1: () -> Int32 = { => 123 } 

    func myFunc() {
        Assert.equals(9, myLambda0(2, 7))
        Assert.equals(123, myLambda1())
    }
}

struct myStruct {
    let myLambda0: (Int64, Int64)->Int64 = {a: Int64, b: Int64 => a + b} 
    var myLambda1: () -> Int32 = { => 123 } 

    func myFunc() {
        Assert.equals(9, myLambda0(2, 7))
        Assert.equals(123, myLambda1())
    }
}

enum myEnum {
    G

    func myFunc() {
        let myLambda0: (Int64, Int64)->Int64 = {a: Int64, b: Int64 => a + b} 
        var myLambda1: () -> Int32 = { => 123 } 

        Assert.equals(9, myLambda0(2, 7))
        Assert.equals(123, myLambda1())
    }
}

main() {
    let myLambda0: (Int64, Int64)->Int64 = {a: Int64, b: Int64 => a + b} 
    var myLambda1: () -> Int32 = { => 123 } 

    Assert.equals(9, myLambda0(2, 7))
    Assert.equals(123, myLambda1())

    var myClassImpl = myClass()
    myClassImpl.myFunc()

    var myStructImpl = myStruct()
    myStructImpl.myFunc()

    myEnum.G.myFunc()
}
