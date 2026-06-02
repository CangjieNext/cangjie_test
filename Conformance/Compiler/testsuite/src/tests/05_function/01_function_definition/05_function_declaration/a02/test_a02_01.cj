/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_05_a02_01

  @Level:         1

  @Assertion:     5.1.5(2) Function declarations can appear in abstract classes and interfaces. 

  @Description:   Check that function can be declared in abstract class or interface and can be implemented in
                  child classes and structures.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

interface myInterface {
    func myIFunc0(): Unit
    func myIFunc1(): Int32
    func myIFunc2(a: Int32): Int32
    func myIFunc3(a: Int32, b: Bool): String
    func myIFunc4(a: Int32, b!: String): String
    static func myIFunc5<T>(a: T): T
}

abstract class myAClass {
    public func myAPublicFunc0(): Unit
    public func myAPublicFunc1(): Int32
    public func myAPublicFunc2(a: Int32): Int32
    public func myAPublicFunc3(a: Int32, b: Bool): String
    public func myAPublicFunc4(a: Int32, b!: String): String

    protected func myAProtectedFunc0(): Unit
    protected func myAProtectedFunc1(): Int32
    protected func myAProtectedFunc2(a: Int32): Int32
    protected func myAProtectedFunc3(a: Int32, b: Bool): String
    protected func myAProtectedFunc4(a: Int32, b!: String): String
}

class myClass0 <: myInterface  {
    public func myIFunc0() {}
    public func myIFunc1(): Int32 { 1 + 2}
    public func myIFunc2(a: Int32): Int32 { a * 2}
    public func myIFunc3(a: Int32, b: Bool): String {"${a} ${b}"}
    public func myIFunc4(a: Int32, b!: String): String {"${a.toString()} ${b}"}
    static public func myIFunc5<T>(a: T): T { a }
}

struct myStruct <: myInterface  {
    public func myIFunc0() {}
    public func myIFunc1(): Int32 { 7 - 2}
    public func myIFunc2(a: Int32): Int32 { a + 2}
    public func myIFunc3(a: Int32, b: Bool): String {"${b} ${a} "}
    public func myIFunc4(a: Int32, b!: String): String {"${b} ${a.toString()} "}
    static public func myIFunc5<T>(a: T): T { a }
}

class myClass1 <: myAClass {
    public func myAPublicFunc0(): Unit {}
    public func myAPublicFunc1(): Int32 { 66 }
    public func myAPublicFunc2(a: Int32): Int32 { a * 3}
    public func myAPublicFunc3(a: Int32, b: Bool): String {
        if(b) {
        return a.toString()
        }
        return "3"
    }
    public func myAPublicFunc4(a: Int32, b!: String): String {
        if(a < 5) {
        return b
        }
        return "DDDDD"
    }

    protected func myAProtectedFunc0(): Unit {}
    protected func myAProtectedFunc1(): Int32 { 16 }
    protected func myAProtectedFunc2(a: Int32): Int32 { a + 10}
    protected func myAProtectedFunc3(a: Int32, b: Bool): String { "asfsdfds" }
    protected func myAProtectedFunc4(a: Int32, b!: String): String { "segfsdgf" }

    func checkProtectedFuncs() {
        Assert.isTrue(this.myAProtectedFunc0() is Unit)
        Assert.equals(16, this.myAProtectedFunc1())
        Assert.isTrue(this.myAProtectedFunc1() is Int32)
        Assert.equals(13, this.myAProtectedFunc2(3))
        Assert.isTrue(this.myAProtectedFunc2(3) is Int32)
        Assert.equals("asfsdfds", this.myAProtectedFunc3(3, true))
        Assert.isTrue(this.myAProtectedFunc3(3, true) is String)
        Assert.equals("segfsdgf", this.myAProtectedFunc4(3, b: ""))
        Assert.isTrue(this.myAProtectedFunc4(6, b: "true") is String)
    }
}

main() {
    Assert.equals(true, myClass0.myIFunc5(true))
    Assert.isTrue(myClass0.myIFunc5(true) is Bool)
    var myClass0Impl = myClass0()
    Assert.isTrue(myClass0Impl.myIFunc0() is Unit)
    Assert.equals(3, myClass0Impl.myIFunc1())
    Assert.isTrue(myClass0Impl.myIFunc1() is Int32)
    Assert.equals(4, myClass0Impl.myIFunc2(2))
    Assert.isTrue(myClass0Impl.myIFunc2(2) is Int32)
    Assert.equals("2 true", myClass0Impl.myIFunc3(2, true))
    Assert.isTrue(myClass0Impl.myIFunc3(2, true) is String)
    Assert.equals("2 true", myClass0Impl.myIFunc4(2, b: "true"))
    Assert.isTrue(myClass0Impl.myIFunc4(2, b: "true") is String)

    Assert.equals(false, myStruct.myIFunc5(false))
    Assert.isTrue(myStruct.myIFunc5(true) is Bool)
    var myStructImpl = myStruct()
    Assert.isTrue(myStructImpl.myIFunc0() is Unit)
    Assert.equals(5, myStructImpl.myIFunc1())
    Assert.isTrue(myStructImpl.myIFunc1() is Int32)
    Assert.equals(4, myStructImpl.myIFunc2(2))
    Assert.isTrue(myStructImpl.myIFunc2(2) is Int32)
    Assert.equals("true 2 ", myStructImpl.myIFunc3(2, true))
    Assert.isTrue(myStructImpl.myIFunc3(2, true) is String)
    Assert.equals("true 2 ", myStructImpl.myIFunc4(2, b: "true"))
    Assert.isTrue(myStructImpl.myIFunc4(2, b: "true") is String)

    var myClass1Impl = myClass1()
    Assert.isTrue(myClass1Impl.myAPublicFunc0() is Unit)
    Assert.equals(66, myClass1Impl.myAPublicFunc1())
    Assert.isTrue(myClass1Impl.myAPublicFunc1() is Int32)
    Assert.equals(36, myClass1Impl.myAPublicFunc2(12))
    Assert.isTrue(myClass1Impl.myAPublicFunc2(12) is Int32)
    Assert.equals("12", myClass1Impl.myAPublicFunc3(12, true))
    Assert.equals("3", myClass1Impl.myAPublicFunc3(12, false))
    Assert.isTrue(myClass1Impl.myAPublicFunc3(12, false) is String)
    Assert.equals("true", myClass1Impl.myAPublicFunc4(4, b: "true"))
    Assert.equals("DDDDD", myClass1Impl.myAPublicFunc4(12, b: ""))
    Assert.isTrue(myClass1Impl.myAPublicFunc4(12, b: "") is String)

    myClass1Impl.checkProtectedFuncs()
}
