/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package UNNAMED

import interoplib.interop.*
import java.lang.*

public class CangjieClass {
    // public func foo(p: (Int, Bool)): (Float32, Int32) {
    //     Logger.println("p[0] = ${p[0]}, p[1] = ${p[1]}")
    //     (114.514, 2333)
    // }
    // public func foo(p: (Int64, Bool) -> Int64): (Int32, Int32) -> Unit {
    //     let result = p(114514, true)
    //     Logger.println("result = ${result}")
    //     {p0: Int32, p1: Int32 => println("cj lambda p0 = ${p0}, p1 = ${p1}")}
    // }
    public func bar(p: (Int64, Bool) -> Int64): Unit {
        let result = p(666, true)
        Logger.println("result = ${result}")
    }
    public func goo(): (Int64, Bool) -> Int64 {
        {
            a: Int64, b: Bool =>
                println("a = ${a}, b = ${b}")
                a + 1
        }
    }
    //     public func goo(): (Int32) -> Int32 {
    //     {
    //         a: =>
    //             println("a = ${a}, b = ${b}")
    //             a + 1
    //     }
    // }
    public init(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)) {
        Logger.println("CangjieClass.init p[0] = ${p[0]}, p[1] = ${p[1]}")
    }

    public func instanceMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, Int8, 
        Int16, Int32, Int64, UInt16, Float32, Float64) {
        Logger.println("CangjieClass.instanceMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
        Logger.println("p[0] = ${p[0]}, p[1] = ${p[1]}")
        (true, 8, 16, 32, 64, 16, 32.0, 64.0)
    }
    public static func staticMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, 
        Int8, Int16, Int32, Int64, UInt16, Float32, Float64) {
        Logger.println("CangjieClass.staticMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
        (true, 8, 16, 32, 64, 16, 32.0, 64.0)
    }
}

public struct CangjieOpenClass {
    public init(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)) {
        Logger.println("CangjieOpenClass.init p[0] = ${p[0]}, p[1] = ${p[1]}")
    }

    public func instanceMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, Int8, 
        Int16, Int32, Int64, UInt16, Float32, Float64) {
        Logger.println("CangjieOpenClass.instanceMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
        Logger.println("p[0] = ${p[0]}, p[1] = ${p[1]}")
        (true, 8, 16, 32, 64, 16, 32.0, 64.0)
    }
    public static func staticMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, 
        Int8, Int16, Int32, Int64, UInt16, Float32, Float64) {
        Logger.println("CangjieOpenClass.staticMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
        (true, 8, 16, 32, 64, 16, 32.0, 64.0)
    }
}

public class CangjieGenericClass<T> {
    public init(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)) {
        Logger.println("CangjieGenericClass.init p[0] = ${p[0]}, p[1] = ${p[1]}")
    }

    public func instanceMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, Int8, 
        Int16, Int32, Int64, UInt16, Float32, Float64) {
        Logger.println("CangjieGenericClass.instanceMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
        Logger.println("p[0] = ${p[0]}, p[1] = ${p[1]}")
        (true, 8, 16, 32, 64, 16, 32.0, 64.0)
    }
    // public static func staticMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, 
    //     Int8, Int16, Int32, Int64, UInt16, Float32, Float64) {
    //     Logger.println("CangjieGenericClass.staticMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
    //     (true, 8, 16, 32, 64, 16, 32.0, 64.0)
    // }
    // public func instanceMemberFunction(p: Int64): Unit {
    // Logger.println("CangjieGenericClass.instanceMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
    // Logger.println("p[0] = ${p[0]}, p[1] = ${p[1]}")
    // (true, 8, 16, 32, 64, 16, 32.0, 64.0)
    // }
    // public static func staticMemberFunction(p: Int64): Unit {
    // Logger.println("CangjieGenericClass.staticMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
    // (true, 8, 16, 32, 64, 16, 32.0, 64.0)
    // }
}

public struct CangjieStruct {
    public init(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)) {
        Logger.println("CangjieStruct.init p[0] = ${p[0]}, p[1] = ${p[1]}")
    }

    public func instanceMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, Int8, 
        Int16, Int32, Int64, UInt16, Float32, Float64) {
        Logger.println("CangjieStruct.instanceMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
        Logger.println("p[0] = ${p[0]}, p[1] = ${p[1]}")
        (true, 8, 16, 32, 64, 16, 32.0, 64.0)
    }
    public static func staticMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, 
        Int8, Int16, Int32, Int64, UInt16, Float32, Float64) {
        Logger.println("CangjieStruct.staticMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
        (true, 8, 16, 32, 64, 16, 32.0, 64.0)
    }
}

public struct CangjieGenericStruct<T0, T1, T2, T3, T4, T5, T6, T7> where T0 <: ToString, T1 <: ToString, T2 <: ToString,
    T3 <: ToString, T4 <: ToString, T5 <: ToString, T6 <: ToString, T7 <: ToString {
    public init(p: (T0, T1, T2, T3, T4, T5, T6, T7)) {
        Logger.println("CangjieGenericStruct.init p[0] = ${p[0]}, p[1] = ${p[1]}")
    }

    public func instanceMemberFunction(p: (T0, T1, T2, T3, T4, T5, T6, T7)): (T0, T1, T2, T3, T4, T5, T6, T7) {
        Logger.println("CangjieGenericStruct.instanceMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
        Logger.println("p[0] = ${p[0]}, p[1] = ${p[1]}")
        p
    }
    // 泛型目前不支持静态成员函数
}

public enum CangjieEnum {
    | A(Int64, Bool)

    public func instanceMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, Int8, 
        Int16, Int32, Int64, UInt16, Float32, Float64) {
        Logger.println("CangjieEnum.instanceMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
        Logger.println("p[0] = ${p[0]}, p[1] = ${p[1]}")
        (true, 8, 16, 32, 64, 16, 32.0, 64.0)
    }
    public static func staticMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, 
        Int8, Int16, Int32, Int64, UInt16, Float32, Float64) {
        Logger.println("CangjieEnum.staticMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
        (true, 8, 16, 32, 64, 16, 32.0, 64.0)
    }
}

public enum CangjieGenericEnum<T> {
    | A(Int64, Bool)

    public func instanceMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, Int8, 
        Int16, Int32, Int64, UInt16, Float32, Float64) {
        Logger.println("CangjieGenericEnum.instanceMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
        Logger.println("p[0] = ${p[0]}, p[1] = ${p[1]}")
        (true, 8, 16, 32, 64, 16, 32.0, 64.0)
    }
    // 泛型目前不支持静态成员函数
}

public interface CangjieInterface {
    // func instanceMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, Int8, Int16, 
    //     Int32, Int64, UInt16, Float32, Float64) {
    //     Logger.println("CangjieStruct.instanceMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
    //     Logger.println("p[0] = ${p[0]}, p[1] = ${p[1]}")
    //     (true, 8, 16, 32, 64, 16, 32.0, 64.0)
    // }
    // static func staticMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, Int8, 
    //     Int16, Int32, Int64, UInt16, Float32, Float64) {
    //     Logger.println("CangjieStruct.staticMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
    //     (true, 8, 16, 32, 64, 16, 32.0, 64.0)
    // }
    // func instanceMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): Unit {
    //     // Logger.println("CangjieStruct.instanceMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
    //     // Logger.println("p[0] = ${p[0]}, p[1] = ${p[1]}")
    //     // (true, 8, 16, 32, 64, 16, 32.0, 64.0)
    // }
    func instanceMemberFunctionWithoutDefaultImpl(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, 
        Int8, Int16, Int32, Int64, UInt16, Float32, Float64)
    static func staticMemberFunctionWithoutDefaultImpl(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, 
        Int8, Int16, Int32, Int64, UInt16, Float32, Float64)
    // static func staticMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): Unit {
    //     Logger.println("CangjieStruct.staticMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
    //     (true, 8, 16, 32, 64, 16, 32.0, 64.0)
    // }
}

public interface CangjieGenericInterface<T0, T1, T2, T3, T4, T5, T6, T7> where T0 <: ToString, T1 <: ToString, T2 <: ToString,
    T3 <: ToString, T4 <: ToString, T5 <: ToString, T6 <: ToString, T7 <: ToString {
    // func instanceMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, Int8, Int16, 
    //     Int32, Int64, UInt16, Float32, Float64) {
    //     Logger.println("CangjieStruct.instanceMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
    //     Logger.println("p[0] = ${p[0]}, p[1] = ${p[1]}")
    //     (true, 8, 16, 32, 64, 16, 32.0, 64.0)
    // }
    // static func staticMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, Int8, 
    //     Int16, Int32, Int64, UInt16, Float32, Float64) {
    //     Logger.println("CangjieStruct.staticMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
    //     (true, 8, 16, 32, 64, 16, 32.0, 64.0)
    // }
    // func instanceMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): Unit {
    //     // Logger.println("CangjieStruct.instanceMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
    //     // Logger.println("p[0] = ${p[0]}, p[1] = ${p[1]}")
    //     // (true, 8, 16, 32, 64, 16, 32.0, 64.0)
    // }
    func instanceMemberFunctionWithoutDefaultImpl(p: (T0, T1, T2, T3, T4, T5, T6, T7)): (T0, T1, T2, T3, T4, T5, T6, T7)
    // 暂不支持泛型静态成员函数
}