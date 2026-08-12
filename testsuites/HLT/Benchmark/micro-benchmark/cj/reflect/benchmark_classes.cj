/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

interface I1 {}

open public class class_01 {}

open public class class_02 <: class_01 {
    public var v1: Int64 = 1
    public static var v2: String = "test"
    public init() {
        v2 = ""
    }
    open public func foo1(): Int64 {
        return 10
    }
    public static func foo2(): Int64 {
        return 10
    }
}

open public class class_03 <: class_02 & ToString & I1 {
    public override func foo1(): Int64 {
        return 100
    }

    public static redef func foo2(): Int64 {
        return 100
    }

    public func toString(): String {
        return "class_03"
    }
}

public class class_04<T> where T <: ToString {}

public class class_05<T> where T <: ToString {
    public var v1: T
    public static var v2: Int64 = 0
    public init(value: T) {
        this.v1 = value
    }
    public func foo1(): T {
        return v1
    }
    public static func foo2(value: T): Unit {
        if (false) {
            throw Exception("illgal")
        }
    }
}