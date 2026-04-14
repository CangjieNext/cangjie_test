package cjworld

import interoplib.objc.*

public type MyBool = Bool
public type MyInt64 = Int64

public class AliasTestClass {
    
    public init() {}

    public func testIntAlias(val: MyInt64): MyInt64 {
        return val + 100
    }

    public func testBoolAlias(flag: MyBool): MyBool {
        return !flag
    }

    public func testMixedAlias(val: MyInt64, flag: MyBool): MyInt64 {
        if (flag) {
            return val
        } else {
            return 0
        }
    }
}

public open class BaseClass {
    public var baseVal: MyInt64

    public init(val: MyInt64) {
        this.baseVal = val
    }

    public open func compute(): MyInt64 {
        return this.baseVal
    }
}


public type BaseAlias = BaseClass
public type MyAliasTestClass = AliasTestClass

public class DerivedClass <: BaseAlias {
    
    public init(val: MyInt64) {
        super(val)
    }


    public override func compute(): MyInt64 {
        return super.compute() + 1000
    }
    public func getMyAliasTestClass(c: MyAliasTestClass): MyAliasTestClass{
        return c
    }
}
