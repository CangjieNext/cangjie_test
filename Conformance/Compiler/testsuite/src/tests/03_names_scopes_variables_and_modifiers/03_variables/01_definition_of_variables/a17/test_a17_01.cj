/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a17_01

  @Level:         1

  @Assertion:    3.3.1(17) When the variable type is specified, a colon ( :) must be used between the pattern and the
                 type. Otherwise, the type is inferred by the compiler.

  @Description:  Check that variables defined without specifying a variable type and with initial value will get right
                 type

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

public var myPublicTopVar = 127
var myTopVar = 127
public let myPublicTopLet = 127
let myTopLet = 127

class MyClass {
    static public var myStaticPublicClassMemberVar = "127"
    public var myPublicClassMemberVar = "127"
    static private var myStaticPrivateClassMemberVar = 127.45
    private var myPrivateClassMemberVar = 127.45
    static protected var myStaticProtectedClassMemberVar = -127
    protected var myProtectedClassMemberVar = -127
    static var myStaticClassMemberVar = r'A'
    var myClassMemberVar = r'A'
    static public let myStaticPublicClassMemberLet = 127
    public let myPublicClassMemberLet = 127
    static private let myStaticPrivateClassMemberLet = 127.12
    private let myPrivateClassMemberLet = 127.12
    static protected let myStaticProtectedClassMemberLet = r'F'
    protected let myProtectedClassMemberLet = r'F'
    static let myStaticClassMemberLet = "AAA"
    let myClassMemberLet = "AAA"

    MyClass() {}

    func checkTypes() {
        Assert.isTrue(myStaticPublicClassMemberVar is String)
        Assert.isTrue(myStaticPrivateClassMemberVar is Float64)
        Assert.isTrue(myStaticProtectedClassMemberVar is Int64)
        Assert.isTrue(myStaticClassMemberVar is Rune)
        Assert.isTrue(myStaticPublicClassMemberLet is Int64)
        Assert.isTrue(myStaticPrivateClassMemberLet is Float64)
        Assert.isTrue(myStaticProtectedClassMemberLet is Rune)
        Assert.isTrue(myStaticClassMemberLet is String)
    }
}

struct Triangle { 
    static var myStaticVar = 10 
    static public var myStaticPublicVar = 10 
    public var myPublicVar = 10 
    var myVar = 10 
    static let myStaticLet = 10 
    static public let myStaticPublicLet = 10 
    public let myPublicLet = 10 
    let myLet = 10 
    Triangle() {}
} 

main() {
    var myLocalVar = 12
    let myLocalLet = 12.0
    Assert.isTrue(myLocalVar is Int64)
    Assert.isTrue(myLocalLet is Float64)

    Assert.isTrue(myPublicTopVar is Int64)
    Assert.isTrue(myTopVar is Int64)
    Assert.isTrue(myPublicTopLet is Int64)
    Assert.isTrue(myTopLet is Int64)

    let myClassImpl = MyClass()
    myClassImpl.checkTypes()

    Assert.isTrue(Triangle.myStaticVar is Int64)
    Assert.isTrue(Triangle.myStaticPublicVar is Int64)
    Assert.isTrue(Triangle.myStaticLet is Int64)
    Assert.isTrue(Triangle.myStaticPublicLet is Int64)

    var myTriangle = Triangle()
    Assert.isTrue(myTriangle.myLet is Int64)
    Assert.isTrue(myTriangle.myPublicLet is Int64)
    Assert.isTrue(myTriangle.myVar is Int64)
    Assert.isTrue(myTriangle.myPublicVar is Int64)
}
