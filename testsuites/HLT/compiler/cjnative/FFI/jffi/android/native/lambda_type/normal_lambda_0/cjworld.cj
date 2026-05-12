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
    public init(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64) -> Unit) {
        let result = p(true, 8, 16, 32, 64, 16, 32.0, 64.0)
        Logger.println("CangjieClass.init, result = ${result}")
    }

    public func instanceMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64) -> Int64): (Bool,
        Int8, Int16, Int32, Int64, UInt16, Float32, Float64) -> UInt16 {
        let result = p(true, 8, 16, 32, 64, 16, 32.0, 64.0)
        Logger.println("CangjieClass.instanceMemberFunction, result = ${result}")
        {p0, p1, p2, p3, p4, p5, p6, p7 => p5}
    }
    public static func staticMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64) -> Float32): (Bool,
        Int8, Int16, Int32, Int64, UInt16, Float32, Float64) -> Float64 {
        let result = p(true, 8, 16, 32, 64, 16, 32.0, 64.0)
        Logger.println("CangjieClass.staticMemberFunction, result = ${result}")
        {p0, p1, p2, p3, p4, p5, p6, p7 => p7}
    }
}

public struct CangjieOpenClass {
    public init(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64) -> Unit) {
        let result = p(true, 8, 16, 32, 64, 16, 32.0, 64.0)
        Logger.println("CangjieOpenClass.init, result = ${result}")
    }

    public func instanceMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64) -> Int64): (Bool,
        Int8, Int16, Int32, Int64, UInt16, Float32, Float64) -> UInt16 {
        let result = p(true, 8, 16, 32, 64, 16, 32.0, 64.0)
        Logger.println("CangjieOpenClass.instanceMemberFunction, result = ${result}")
        {p0, p1, p2, p3, p4, p5, p6, p7 => p5}
    }
    public static func staticMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64) -> Float32): (Bool,
        Int8, Int16, Int32, Int64, UInt16, Float32, Float64) -> Float64 {
        let result = p(true, 8, 16, 32, 64, 16, 32.0, 64.0)
        Logger.println("CangjieOpenClass.staticMemberFunction, result = ${result}")
        {p0, p1, p2, p3, p4, p5, p6, p7 => p7}
    }
}

public struct CangjieStruct {
    public init(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64) -> Unit) {
        let result = p(true, 8, 16, 32, 64, 16, 32.0, 64.0)
        Logger.println("CangjieStruct.init, result = ${result}")
    }

    public func instanceMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64) -> Int64): (Bool,
        Int8, Int16, Int32, Int64, UInt16, Float32, Float64) -> UInt16 {
        let result = p(true, 8, 16, 32, 64, 16, 32.0, 64.0)
        Logger.println("CangjieStruct.instanceMemberFunction, result = ${result}")
        {p0, p1, p2, p3, p4, p5, p6, p7 => p5}
    }
    public static func staticMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64) -> Float32): (Bool,
        Int8, Int16, Int32, Int64, UInt16, Float32, Float64) -> Float64 {
        let result = p(true, 8, 16, 32, 64, 16, 32.0, 64.0)
        Logger.println("CangjieStruct.staticMemberFunction, result = ${result}")
        {p0, p1, p2, p3, p4, p5, p6, p7 => p7}
    }
}

public enum CangjieEnum {
    | A(Int64, Bool)

    public func instanceMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64) -> Int64): (Bool,
        Int8, Int16, Int32, Int64, UInt16, Float32, Float64) -> UInt16 {
        let result = p(true, 8, 16, 32, 64, 16, 32.0, 64.0)
        Logger.println("CangjieEnum.instanceMemberFunction, result = ${result}")
        {p0, p1, p2, p3, p4, p5, p6, p7 => p5}
    }
    public static func staticMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64) -> Float32): (Bool,
        Int8, Int16, Int32, Int64, UInt16, Float32, Float64) -> Float64 {
        let result = p(true, 8, 16, 32, 64, 16, 32.0, 64.0)
        Logger.println("CangjieEnum.staticMemberFunction, result = ${result}")
        {p0, p1, p2, p3, p4, p5, p6, p7 => p7}
    }
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

    func instanceMemberFunctionWithoutDefaultImpl(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64) -> Int64): (Bool,
        Int8, Int16, Int32, Int64, UInt16, Float32, Float64) -> UInt16
    // static func staticMemberFunctionWithoutDefaultImpl(
    //     p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64) -> Float32): (Bool, Int8, Int16, Int32, Int64,
    //     UInt16, Float32, Float64) -> Float64
}
