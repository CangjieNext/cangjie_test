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

public enum TestEnum {
    | Num(Int64)
    // | WrapEnum(BaseEnum)
    // | WrapStruct(BaseStruct)
    // | WrapClosedClass(BaseClosedClass)
    // | WrapOpenClass(BaseOpenClass)
    // | WrapInterface(BaseInterface)
    // broken llvm ir
    // | WrapOption(?Int64)
    // Unsupport type
    // | WrapArray(Array<Int64>)
    // Unsupport type
    // | WrapRange(Range<Int64>)

    public func funcEnum(e: BaseEnum): BaseEnum { return e }
    public func funcStruct(s: BaseStruct): BaseStruct { return s }
    public func funcClosedClass(c: BaseClosedClass): BaseClosedClass { return c }
    // 未映射至.m和.h文件中
    // public func funcOpenClass(c: BaseOpenClass): BaseOpenClass { return c }
    public func funcInterface(i: BaseInterface): BaseInterface { return i }
    // 未映射至.m和.h文件中
    // public func funcOption(o: Option<Int64>): Option<Int64> {return o}
    // 未映射至.m和.h文件中
    // public func funcTuple(t: (Int64, Int64)): (Int64, Int64) {return t}
    // 未映射至.m和.h文件中
    // public func funcArray(a: Array<Int64>): Array<Int64> {return a}
    // 未映射至.m和.h文件中
    // public func funcRange(r: Range<Int64>): Range<Int64> {return r}

    public func funcFuncparams(_: Bool, i: Int64) { return i }
}
