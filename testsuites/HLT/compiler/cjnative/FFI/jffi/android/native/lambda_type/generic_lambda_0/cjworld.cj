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

public struct CangjieGenericStruct<T0, T1> where T0 <: ToString, T1 <: ToString {
    public init(p: (T0, T1) -> T0, p1: (T0, T1)) {
        let result = p(p1[0], p1[1])
        Logger.println("CangjieGenericStruct.init, result = ${result}")
    }

    public func instanceMemberFunction(p: (T0, T1) -> T0, p1: (T0, T1)): (T1, T0) -> T0 {
        let result = p(p1[0], p1[1])
        Logger.println("CangjieGenericStruct.instanceMemberFunction, result = ${result}")
        {a, b => b}
    }
    // 泛型目前不支持静态成员函数
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

public interface CangjieGenericInterface<T0, T1, T2, T3, T4, T5, T6, T7> where T0 <: ToString, T1 <: ToString,
    T2 <: ToString, T3 <: ToString, T4 <: ToString, T5 <: ToString, T6 <: ToString, T7 <: ToString {
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
