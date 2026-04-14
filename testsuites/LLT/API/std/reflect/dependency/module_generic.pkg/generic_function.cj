/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 */

package module_generic.pkg

public class GenericClass<T> {
    public var value: T
    
    public init(v: T) {
        value = v
    }
    
    public func genericMethod<U>(x: U): (T, U) {
        (value, x)
    }
    
    public static func genericStaticMethod<V>(y: V): V {
        y
    }
}

public func genericGlobalFunc<W>(a: W, b: Int64): W {
    a
}