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

// 均无法映射
public open class TestOpenClass {
    // broken llvm ir
    // public open func funcEnum(e: BaseEnum): BaseEnum { return e }
    // public open func funcStruct(s: BaseStruct): BaseStruct { return s }
    // public open func funcClosedClass(c: BaseClosedClass): BaseClosedClass { return c }
    // public open func funcOpenClass(c: BaseOpenClass): BaseOpenClass { return c }
    // public open func funcInterface(i: BaseInterface): BaseInterface { return i }


}