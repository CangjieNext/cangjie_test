/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_02_a02_03

  @Level:         1

  @Assertion:    10.1.2.2(2) Only functions that pass the function call type 
                 check can be added to the candidate set.
                 open class Base {}
                 class Sub <: Base {}
                 func f<X, Y>(a: X, b: Y) {}         // f1, number of type parameters is not matched
                 func f<X>(a: Base, b: X) where X <: Sub {} // f2
                 func test() {
                  f<Base>(Base(), Sub())        // candidate set: { f2 }
                 }

  @Description:  Test taken from spec. Test was fixed and transformed to executed                  

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

    import utils.assert.Assert
    open class Base {}
    class Sub <: Base {}
    func f<X, Y>(a: X, b: Y):Int64 {         // f1, number of type parameters is not matched
        return -1
    }
    func f<X>(a: Base, b: X):Int64 where X <: Sub { // f2
        return 1
    }
    func test():Int64 {
        f<Sub>(Base(), Sub())        // candidate set: { f2 }
    }

main() {
    var rt:Int64 = test()
    Assert.equals(1, rt)
}