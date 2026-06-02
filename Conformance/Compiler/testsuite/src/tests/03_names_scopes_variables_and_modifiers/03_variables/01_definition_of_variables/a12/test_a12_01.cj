/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a12_01

  @Level:         1

  @Assertion:    3.3.1(12) When defining member variables in classes and structs, 
                 only the binding pattern can be used (see Binding Patterns).

  @Description:  Check that struct member variables can be defined using binding pattern.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

struct MyStruct { 
    static var myStaticVarInt32: Int32 = 2
    var myStaticVar = 2
    public static var myPublicStaticVarString: String = "mystring"
    public var myPublicStaticVar = "myanotherstring"
    private static var myPrivateStaticVarChar: Rune = r'H'
    private var myPrivateStaticVar = r'D'
    let myStaticLetChar: Rune = r'P'
    static let myStaticLet = "12"
    public let myPublicStaticLetUInt16: UInt16 = 8
    public static let myPublicStaticLetFloat64: Float64 = 0.226
    private let myPrivateStaticLetInt32: Int32 = 26
    private static let myPrivateStaticLet = 10
} 

main() {
    Assert.equals(2, MyStruct.myStaticVarInt32)
    Assert.equals("mystring", MyStruct.myPublicStaticVarString)
    Assert.equals("12", MyStruct.myStaticLet)
    Assert.equals(0.226, MyStruct.myPublicStaticLetFloat64)

    var myStructImpl = MyStruct()
    Assert.equals(2, myStructImpl.myStaticVar)
  
    Assert.equals("myanotherstring", myStructImpl.myPublicStaticVar)
    Assert.equals(r'P', myStructImpl.myStaticLetChar)

    Assert.equals(8, myStructImpl.myPublicStaticLetUInt16)
}
