/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_01_a07_01

  @Level:         1

  @Assertion:   14.1.1(7) The format of the ToTokens interface is as follows:
                interface ToTokens {
                    func toTokens(): Tokens
                } 

  @Description: Check that interface ToTokens contains function toTokens
  
  @Mode:        compileonly

  @Negative:    no

*/

import std.ast.*

interface  MyI <: ToTokens {
    override func toTokens(): Tokens // Checking that the supertype has this function(w/o errors)
}

class MyClass <: ToTokens {
    public func toTokens(): Tokens { Tokens() } // Checking that the supertype has this function(w/o errors)
}

struct MyStruct <: ToTokens {
    var t = Tokens()
    public func toTokens(): Tokens { t } // Checking that the supertype has this function(w/o errors)
}

main(): Unit {}
