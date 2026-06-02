/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_02_a02_02

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

  @Description:  compile test taken from spec. In this test error from spec is fixed
                 It is needed to correspond to constraind  

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

    open class Base {}
    class Sub <: Base {}
    func f<X, Y>(a: X, b: Y) {}         // f1, number of type parameters is not matched
    func f<X>(a: Base, b: X) where X <: Sub {} // f2
    func test() {
        f<Sub>(Base(), Sub())        // candidate set: { f2 }
    }

main() {
    test()
}