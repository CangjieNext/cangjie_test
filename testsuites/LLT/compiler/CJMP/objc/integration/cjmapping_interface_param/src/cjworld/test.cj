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

public interface TestInterface {
    func funcEnum(e: BaseEnum): BaseEnum
    func funcStruct(s: BaseStruct): BaseStruct
    func funcClosedClass(c: BaseClosedClass): BaseClosedClass
    func funcOpenClass(c: BaseOpenClass): BaseOpenClass
    func funcInterface(i: BaseInterface): BaseInterface
    // broken llvm ir
    // public func funcOption(o: ?Int64): ?Int64 {return o}
    // broken llvm ir
    // func funcTuple(t: (Int64, Int64)): (Int64, Int64)
    // Unsupport type
    // func funcArray(a: Array<Int64>): Array<Int64>
    // Unsupport type
    // func funcRune(r: Rune): Rune
    // Unsupport type
    // func funcRange(r: Range<Int64>): Range<Int64>
    // 操作符重载函数会被cjc映射过去
    // operator func +(other: TestInterface): TestInterface
}