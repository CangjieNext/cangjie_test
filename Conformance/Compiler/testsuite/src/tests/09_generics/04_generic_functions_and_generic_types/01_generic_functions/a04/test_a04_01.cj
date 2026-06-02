/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_04_01_a04_01

  @Level:         1

  @Assertion: 9.4.1(4) The syntax of generic functions is as follows. 
              functionDefinition
                  : functionModifierList? 'func' identifier
                  typeParameters functionParameters
                  (':' type)? genericConstraints?
                  ('=' expression | block)?
                  ;

  @Description: Check function syntax.

  @Mode: run

  @Negative: no

  @Issue: 0006262

*/

import utils.assert.Assert

// Optional modifier.
public func f1<T>(x: T) {
    return x
}

func f2<T>(x: T) {
    return x
}

// Several type parameters and function parameters.
func f3<T1, T2>(x1: T1, x2: T2) {
    return (x1, x2)
}

// Optional return type.
func f4<T>(x: T): T {
    return x
}

// Generic constraint.
interface I {}

class Impl <: I {}

func f5<T>(x: T) where T <: I {
    return x
}

// No block.
interface I2 {
   static func f6<T>(x: T): T;
}

main() {
    Assert.isTrue(f1<String>("hello world") is String)
    Assert.isTrue(f2<String>("hello world") is String)
    Assert.isTrue(f3<Int32, Float32>(42, 35.0)[0] is Int32)
    Assert.isTrue(f3<Int32, Float32>(42, 35.0)[1] is Float32)
    Assert.isTrue(f4<String>("hello world") is String)
    Assert.isTrue(f5<Impl>(Impl()) is Impl)
}

