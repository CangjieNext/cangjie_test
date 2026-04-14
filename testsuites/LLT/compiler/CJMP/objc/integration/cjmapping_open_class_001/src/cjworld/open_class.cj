package cjworld

import interoplib.objc.*

public class Class_01 {
    public init() {
        this.x = 0
        this.tag = 1
        this.y = 2
    }

    public init(x: Int64) {
        this.x = x
        this.tag = 10
        this.y = 11
    }

    public Class_01(public var x: Int64, public var tag: Int64, public var y: Int64) {}

    public func getval_x(): Int64 {
        return this.x
    }
    public func getval_tag(): Int64 {
        return this.tag
    }
    public func getval_y(): Int64 {
        return this.y
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

public open class Class_03 <: Class_02 {
    public var subVal: Int64

    public init(baseVal: Int64, subVal: Int64) {
        super(baseVal) 
        this.subVal = subVal
    }

    public override func compute(): Int64 {
        return super.compute() + this.subVal
    }

}

// 被注释的不会被cjc映射
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
    public open func open_public_func() : Int64 {
        return 5
    }
    protected open func open_protected_func() : Int64 {
        return 6
    }
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
}