/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 */

package module_error.pkg

public abstract class AbstractClass {
    public func abstractMethod(): Int64
    
    public func normalMethod(): Int64 {
        42
    }
}

public class ConcreteClass {
    public var mutableVar: Int64 = 100
    public let immutableVar: String = "immutable"
    
    public init() {}
    
    public func funcWithTypeCheck(a: Int64): Int64 {
        a
    }
}