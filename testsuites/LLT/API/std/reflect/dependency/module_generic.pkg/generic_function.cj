/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
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
