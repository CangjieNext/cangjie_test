/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_01_a10_01

  @Level:         1

  @Assertion:   14.1.1(10) - User-defined data structures must proactively implement the ToTokens interface.  

  @Description: Check that user-defined data structures can implement the ToTokens interface
  
  @Mode:        run

  @Negative:    no

*/

import utils.assert.Assert
import std.ast.*

public class TestA1001<T> <: ToTokens where T <: ToTokens{
    public var value: T
    public func toTokens(): Tokens { value.toTokens() }

    init(value: T) {
        this.value = value
    }
}

main(): Unit {
    var v0 = TestA1001<Int64>(345)
    
    Assert.isTrue(v0 is ToTokens)
    Assert.isTrue(v0.toTokens() is Tokens)
    Assert.equals(345.toTokens().toString(), v0.toTokens().toString())
}
