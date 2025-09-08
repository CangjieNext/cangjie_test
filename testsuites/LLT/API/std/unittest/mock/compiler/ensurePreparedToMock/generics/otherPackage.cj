/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package otherPackage

public func genericFoo<T>(x: T) {
    return "original"
}

public class OtherClass {
    public static func genericFoo<T>(x: T) {
        return "original"
    }

    public static func id<T>(x: T) {
        return x
    }
}

public func instantiations() {
    println(genericFoo<Int64>(1))
    println(genericFoo<Float64>(1.0))

    println(OtherClass.genericFoo<Int64>(1))
    println(OtherClass.genericFoo<Float64>(1.0))

    println(OtherClass.id(1))
    println(OtherClass.id(1.0))
}
