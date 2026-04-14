package cjworld

import interoplib.objc.*


public enum BaseEnum {
    | BaseVal
    public func getVal(): Int64 { return 100 }
}

public struct BaseStruct {
    public var val: Int64
    public init(v: Int64) { this.val = v }
    public func getVal(): Int64 { return this.val }
}

public class BaseClosedClass {
    public init() {}
    public func getVal(): Int64 { return 300 }
}

public open class BaseOpenClass {
    public init() {}
    public func getVal(): Int64 { return 400 }
}

public interface BaseInterface {
    func doNothing(): Unit
    func getVal(): Int64
}

public class TestClosedClass {
    // public var num: Int64
    // public init(num: Int64) {
    //     this.num = num
    // }
    public func funcEnum(e: BaseEnum): BaseEnum { return e }
    public func funcStruct(s: BaseStruct): BaseStruct { return s }
    public func funcClosedClass(c: BaseClosedClass): BaseClosedClass { return c }
    public func funcInterface(i: BaseInterface): BaseInterface { return i }
    //操作符重载函数会被cjc映射过去，但是clang报错
    // public operator func +(other: Int64): TestClosedClass {
    //     return TestClosedClass(this.num + other)
    // }
}