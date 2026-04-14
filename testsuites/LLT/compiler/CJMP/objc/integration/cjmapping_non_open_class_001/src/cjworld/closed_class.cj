package cjworld

import interoplib.objc.*

public class Class_01 {
    public func getval() :Int64 {
        return 10
    }
}


public open class Class_02 {
    public var baseVal: Int64

    public init(baseVal: Int64) {
        this.baseVal = baseVal
    }

    public open func compute(): Int64 {
        return this.baseVal
    }
}

public class Class_03 <: Class_02 {
    public var subVal: Int64

    public init(baseVal: Int64, subVal: Int64) {
        super(baseVal) 
        this.subVal = subVal
    }

    public override func compute(): Int64 {
        return super.compute() + this.subVal
    }

}

//被注释的不会被cjc映射
public open class Class_04 {
    public func public_func() : Int64 {
        return 1
    }
    // private func private_func() : Int64 {
    //     return 2
    // }
    // internal func internal_func() : Int64 {
    //     return 3
    // }
    // protected func protected_func() : Int64 {
    //     return 4
    // }
    public static func static_public_func() : Int64 {
        return 7
    }
    
    // private static func static_private_func() : Int64 {
    //     return 8
    // }
    
    // internal static func static_internal_func() : Int64 {
    //     return 9
    // }
    
    // protected static func static_protected_func() : Int64 {
    //     return 10
    // }
    public func closed_class_func(c: Class_01) :Class_01 {
        return c
    }
}