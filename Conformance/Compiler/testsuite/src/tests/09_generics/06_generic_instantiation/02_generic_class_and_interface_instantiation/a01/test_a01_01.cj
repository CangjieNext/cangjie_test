/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_06_02_a01_01

  @Level:         1

  @Assertion: 9.6.2(1)
              class Foo<T> <: IBar<T> {
                  var a: T
                  static func foo(a: T) {...}
                  func bar(a: T, b: Int32): Unit {...}
              }

              interface IBar<T> { 
                  func bar(a: T, b: Int32): Unit 
              } 

              When T = Int32, the following instantiated declaration will be generated 

              class Foo$Int32 <: IBar$Int32 { 
                  var a: Int32 
                  static func foo(a: Int32) {...} 
                  func bar(a: Int32) {...} 
              } 

              interface IBar$Int32 { 
                  func bar(a: Int32, b: Int32) 
              } 

  @Description: Check the instantiation for example provided.

  @Mode: run

  @Negative: no

  @Issue: 0006284

*/

import utils.assert.Assert

class Foo<T> <: IBar<T> {
    var a: T

    init(arg: T) {
        a = arg
    }

    static func foo(a: T) {
        return "foo"
    }

    public func bar(a: T, b: Int32): Unit {}
}

interface IBar<T> { 
    func bar(a: T, b: Int32): Unit
} 

main() {
    let f = Foo<Int32>(1)
    Assert.equals("foo", Foo<Int32>.foo(1))
    Assert.isTrue(f.bar is (Int32, Int32) -> Unit)
}

