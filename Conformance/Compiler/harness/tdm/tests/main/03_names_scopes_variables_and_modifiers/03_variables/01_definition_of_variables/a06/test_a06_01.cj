/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_A06_01

  @Assertion:    3.3.1(6) The modifiers of member variables of the struct type include static.

  @Description:  Check that member of the struct type variables declaration can include static modifier.
                    Cases: mutable/immutable, with/without type declaration, using public/private modifiers, w/o modifiers

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

struct myStruct {
    static var myStaticVarInt32: Int32 = 2
    static var myStaticVar = 2
    public static var myPublicStaticVarString: String = "mystring"
    public static var myPublicStaticVar = "myanotherstring"
    private static var myPrivateStaticVarChar: Char = 'H'
    private static var myPrivateStaticVar = 'D'
    static let myStaticLetChar: Char = 'P'
    static let myStaticLet = "12"
    public static let myPublicStaticLetUInt16: UInt16 = 8
    public static let myPublicStaticLetFloat64:Float64 = 0.226
    private static let myPrivateStaticLetInt32: Int32 = 26
    private static let myPrivateStaticLet = 10
} 

main() {
}