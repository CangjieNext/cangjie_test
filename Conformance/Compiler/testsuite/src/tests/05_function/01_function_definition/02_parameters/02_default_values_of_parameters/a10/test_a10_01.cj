/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a10_01

  @Level:         1

  @Assertion:     5.1.2.2(10) The names introduced in the default value, does not need to have the same or least 
                  restrictive accessibility of the function.

  @Description:   Check that the variables used by the names for the default values can have different 
                  accessibility levels independent of the accessibility level of the function.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
public var testA1001 = "SSS"
var myTopVar = "SSS"

open class myClass  {
  private static var myPrivateClassStaticVar: UInt32 = 2
  static var myStaticClassVar = true
  public var myClassPublicVar: Int64 = 12
  private var myClassPrivateVar: Float32 = 64.3
  protected var myClassProtectedVar: String = "12"
  var myClassVar: Rune = 'v'

  static func myStaticClassFunc(x!: UInt32 =  myPrivateClassStaticVar, y!: Bool = myStaticClassVar) {}

  public func myClassPublicFunc(a!: Int64 = myClassPublicVar, b!: Float32 = myClassPrivateVar, 
                                c!: String = myClassProtectedVar, d!: Rune = myClassVar) {}
  private func myClassPrivateFunc(a!: Int64 = myClassPublicVar, b!: Float32 = myClassPrivateVar, 
                                c!: String = myClassProtectedVar, d!: Rune = myClassVar) {}
  protected func myClassProtectedFunc(a!: Int64 = myClassPublicVar, b!: Float32 = myClassPrivateVar, 
                                c!: String = myClassProtectedVar, d!: Rune = myClassVar) {}
}

struct myStruct {
  private static var myPrivateStaticVar: UInt32 = 2
  static var myStaticVar = true
  public var myStructPublicVar: Int64 = 12
  private var myStructPrivateVar: Float32 = 64.3
  var myStructVar: Rune = 'v'

  static func myStaticFunc(x!: UInt32 =  myPrivateStaticVar, y!: Bool = myStaticVar) {}

  public func myStructPublicFunc(a!: Int64 = myStructPublicVar, b!: Float32 = myStructPrivateVar, 
                                c!: String = myTopVar,d!: Rune = myStructVar) {}
  private func myStructPrivateFunc(a!: Int64 = myStructPublicVar, b!: Float32 = myStructPrivateVar, 
                                c!: String = testA1001,d!: Rune = myStructVar) {}
}

func myFunc(g!: String = testA1001, f!: Bool = myStruct.myStaticVar) {}

main() {
}
