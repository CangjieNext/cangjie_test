/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_05_a02_01

  @Level:         1

  @Assertion:       5.5(2) The syntax of a Lambda expression is as follows. 
                    lambdaExpression 
                        : '{' NL* lambdaParameters? '=>' NL* expressionOrDeclarations '}' 
                    ; 
                    lambdaParameters
                        : lambdaParameter (',' lambdaParameter)* ','?
                    ;
                    lambdaParameter
                        : (identifier | '_') (':' type)?
                    ;
 
  @Description:     Check that usage of right syntax for lambda expession will not poduce an error.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

class myClass {
    let lambda0: (Int64, Int64) -> Int64 = {a: Int64, b: Int64 => a + b } 
    var lambda1: () -> Int32 = { 
        => 46 
    } 
    let lambda2 = { y: Int64 , _: Int64 => return y*y }
    let lambda3: (Int32, Int32 ) -> Int32 = { x, _ => return x*x }

    public func checkLambda() {
        Assert.equals(9, lambda0(2, 7))
        Assert.equals(46, lambda1())
        Assert.equals(36, lambda2(6, 13))
        Assert.equals(9, lambda2(-3, 4))
        Assert.equals(121, lambda3(11, 13))
        Assert.equals(100, lambda3(10, 4))
    }
}

struct myStruct {
    let lambda0: (Int64, Int64) -> Int64 = {a: Int64, b: Int64 => a + b } 
    var lambda1: () -> Int32 = { => 46 } 
    let lambda2 = { y: Int64 , _: Int64 => return y*y }
    let lambda3: (Int32, Int32 ) -> Int32 = { x, _ 
            => 
            return x*x }

    public func checkLambda() {
        Assert.equals(9, lambda0(2, 7))
        Assert.equals(46, lambda1())
        Assert.equals(36, lambda2(6, 13))
        Assert.equals(9, lambda2(-3, 4))
        Assert.equals(121, lambda3(11, 13))
        Assert.equals(100, lambda3(10, 4))
    }
}

enum myEnum {
    F

    public func checkLambda() {
        let lambda0: (Int64, Int64) -> Int64 = {
            a: Int64, b: Int64 
            => a + b } 
        var lambda1: () -> Int32 = { => 46 } 
        let lambda2 = { y: Int64 , _: Int64 => return y*y }
        let lambda3: (Int32, Int32 ) -> Int32 = { x, _ => return x*x }

        Assert.equals(9, lambda0(2, 7))
        Assert.equals(46, lambda1())
        Assert.equals(36, lambda2(6, 13))
        Assert.equals(9, lambda2(-3, 4))
        Assert.equals(121, lambda3(11, 13))
        Assert.equals(100, lambda3(10, 4))
    }
}

let lambda0: (Int64, Int64) -> Int64 = {a: Int64, b: Int64 => a + b } 
var lambda1: () -> Int32 = { => 46 } 
let lambda2 = { y: Int64 , _: Int64 
    => 
    return y*y 
}
let lambda3: (Int32, Int32 ) -> Int32 = { x, _ => return x*x }

main() {

    Assert.equals(9, {a: Int64, b: Int64 => a + b}(2, 7))
    Assert.equals(9, {n: Int64 , _: Int64 => return n*n }(-3, 4))
    Assert.equals(16, { n: Int32, _: Float16 
    => return n*n 
    }(4, 8.0))
    Assert.equals("Hello", { _: String => return "Hello" }("erl"))

    Assert.equals(9, lambda0(2, 7))
    Assert.equals(46, lambda1())
    Assert.equals(36, lambda2(6, 13))
    Assert.equals(9, lambda2(-3, 4))
    Assert.equals(121, lambda3(11, 13))
    Assert.equals(100, lambda3(10, 4))

    var myClassImpl = myClass()
    myClassImpl.checkLambda()

    var myStructImpl = myStruct()
    myStructImpl.checkLambda()

    myEnum.F.checkLambda()
}
