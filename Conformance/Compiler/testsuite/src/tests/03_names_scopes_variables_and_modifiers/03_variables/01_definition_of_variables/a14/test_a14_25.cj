/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a14_25

  @Level:         1

  @Assertion:    3.3.1(14) If the variable type is not declared, you need to assign an initial value to the variable.

  @Description:  Check that if variables defined with a variable type initialization in declaration is not required

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

class MyClass {
    public var myPublicClassMemberVarInt64: Int64
    private var myPrivateClassMemberVarInt64: Int64
    protected var myProtectedClassMemberVarUInt16: UInt16
    var myClassMemberVarUInt64: UInt64
    public let myPublicClassMemberLetFloat32: Float32
    private let myPrivateClassMemberLetChar: Rune
    protected let myProtectedClassMemberLetInt32: Int32
    let myClassMemberLetString: String

    MyClass() {
        myPublicClassMemberVarInt64 = 22
        myPrivateClassMemberVarInt64 = -47
        myProtectedClassMemberVarUInt16 = 26
        myClassMemberVarUInt64 = 9
        myPublicClassMemberLetFloat32 = 0.25
        myPrivateClassMemberLetChar = 'H'
        myProtectedClassMemberLetInt32 = -36
        myClassMemberLetString = "kjhasdg"
    }
}

struct MyStruct { 
    public var myPublicVar: Int32
    var myVar: Int64
    public let myPublicLet: Rune
    let myLet: String

    MyStruct() {
        myPublicVar = 3
        myVar = 128
        myPublicLet = 'A'
        myLet = "FFF"
    }
} 

main() {
    var myLocalVarInt32: Int32
    let myLocalLetInt64: Int64 = 12
}
