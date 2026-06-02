/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a16_02

  @Level:         1

  @Assertion:    3.3.1(16) 5. Variables can be defined in the top-level, expression, or class/struct type

  @Description:  Check that immutable variables can be defined in the top-level, expression, or class/struct type
                 Used variants: variables, class/struct members, local variables in expression

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

public let myPublicTopVar: Int8 = 127
let myTopVar: Int8 = 126

class MyClass {
    static public let myStaticPublicClassMemberVar: Int8 = 127
    public let myPublicClassMemberVar: Int8 = 127
    static private let myStaticPrivateClassMemberVar: Int8 = 127
    private let myPrivateClassMemberVar: Int8 = 127
    static protected let myStaticProtectedClassMemberVar: Int8 = 127
    protected let myProtectedClassMemberVar: Int8 = 127
    static let myStaticClassMemberVar: Int8 = 127
    let myClassMemberVar: Int8 = 127

    public let myPublicClassMemberVarNotInitalised: Int8
    private let myPrivateClassMemberVarNotInitalised: Int8
    protected let myProtectedClassMemberVarNotInitalised: Int8
    let myClassMemberVarNotInitalised: Int8

    MyClass(inVal: Int8) {
        this.myPublicClassMemberVarNotInitalised = inVal
        this.myPrivateClassMemberVarNotInitalised = inVal
        this.myProtectedClassMemberVarNotInitalised = inVal
        this.myClassMemberVarNotInitalised = inVal
    }

    func checkValues(inVal: Int8) {
        Assert.equals(this.myPrivateClassMemberVarNotInitalised, inVal)
        Assert.equals(this.myPublicClassMemberVarNotInitalised, inVal)
        Assert.equals(this.myProtectedClassMemberVarNotInitalised, inVal)
        Assert.equals(this.myClassMemberVarNotInitalised, inVal)
    }
}

struct Triangle { 
    let base: Int32
    let height: Int32

    init (inBase: Int32, inHeight: Int32) { 
        this.base = inBase 
        this.height = inHeight 
    } 
} 

class NumberInput <: Resource {
    private var elemCount: Int64
    NumberInput(inVal: Int64) {
        this.elemCount = inVal
    }

    public func isClosed(): Bool {
        return true
    }

    public func close(): Unit {
        return
    }

    public func hasNextNumber(): Bool {
        return (elemCount > 0)
    }

    public func nextNumber(): Int64 {
        var tmpCount = this.elemCount
        this.elemCount--
        return tmpCount
    }
}

main() {
    let f1: (Int32, Int32)->Int32 = {a: Int32, b: Int32 => a - b}
    var f1Check = f1(16, 10)
    Assert.equals(6, f1Check)
    let score: Int64 = 90 
    Assert.equals(90, score)

    var scoreResult: String = match (score) { 
        case 0 => "zero" 
        case 50 => "pass" 
        case fail => "fail"
    }

    Assert.equals("fail", scoreResult)
    let myArr: Array<Int32> = [1, 3, 7, 9]
    var tmpCount = 0

    for(elem in myArr) {
        Assert.equals(elem, myArr[tmpCount])
        print("${elem}")
        tmpCount++
    }

    try { 
        let myElement = myArr[3] 
        Assert.equals(7, myElement)
    } catch (e: Exception) { 
        print("${e.message}") 
    }

    try (inputNumber = NumberInput(3)) { 
        while (inputNumber.hasNextNumber()) { 
            let tmpNumberString = inputNumber.nextNumber() 
            print(tmpNumberString)
        } 
    }

  let myClassImpl = MyClass(5) 
  myClassImpl.checkValues(5)
}
