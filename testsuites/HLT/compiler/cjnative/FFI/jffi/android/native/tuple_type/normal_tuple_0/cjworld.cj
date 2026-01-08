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
    public init(p: (Bool, Int, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)) {
        Logger.println("CangjieClass.init p[0] = ${p[0]}, p[1] = ${p[1]}")
    }

    public func instanceMemberFunction(p: (Bool, Int, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, Int, 
        Int8, Int16, Int32, Int64, UInt16, Float32, Float64) {
        Logger.println("CangjieClass.instanceMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
        Logger.println("p[0] = ${p[0]}, p[1] = ${p[1]}")
        (true, 6, 8, 16, 32, 64, 16, 32.0, 64.0)
    }
    public static func staticMemberFunction(p: (Bool, Int, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, 
        Int, Int8, Int16, Int32, Int64, UInt16, Float32, Float64) {
        Logger.println("CangjieClass.staticMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
        (true, 6, 8, 16, 32, 64, 16, 32.0, 64.0)
    }
}

public struct CangjieOpenClass {
    public init(p: (Bool, Int, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)) {
        Logger.println("CangjieOpenClass.init p[0] = ${p[0]}, p[1] = ${p[1]}")
    }

    public func instanceMemberFunction(p: (Bool, Int, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, Int, 
        Int8, Int16, Int32, Int64, UInt16, Float32, Float64) {
        Logger.println("CangjieOpenClass.instanceMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
        Logger.println("p[0] = ${p[0]}, p[1] = ${p[1]}")
        (true, 6, 8, 16, 32, 64, 16, 32.0, 64.0)
    }
    public static func staticMemberFunction(p: (Bool, Int, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, 
        Int, Int8, Int16, Int32, Int64, UInt16, Float32, Float64) {
        Logger.println("CangjieOpenClass.staticMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
        (true, 6, 8, 16, 32, 64, 16, 32.0, 64.0)
    }
}

public struct CangjieStruct {
    public init(p: (Bool, Int, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)) {
        Logger.println("CangjieStruct.init p[0] = ${p[0]}, p[1] = ${p[1]}")
    }

    public func instanceMemberFunction(p: (Bool, Int, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, Int, 
        Int8, Int16, Int32, Int64, UInt16, Float32, Float64) {
        Logger.println("CangjieStruct.instanceMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
        Logger.println("p[0] = ${p[0]}, p[1] = ${p[1]}")
        (true, 6, 8, 16, 32, 64, 16, 32.0, 64.0)
    }
    public static func staticMemberFunction(p: (Bool, Int, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, 
        Int, Int8, Int16, Int32, Int64, UInt16, Float32, Float64) {
        Logger.println("CangjieStruct.staticMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
        (true, 6, 8, 16, 32, 64, 16, 32.0, 64.0)
    }
}

public enum CangjieEnum {
    | A(Int64, Bool)

    public func instanceMemberFunction(p: (Bool, Int, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, Int, 
        Int8, Int16, Int32, Int64, UInt16, Float32, Float64) {
        Logger.println("CangjieEnum.instanceMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
        Logger.println("p[0] = ${p[0]}, p[1] = ${p[1]}")
        (true, 6, 8, 16, 32, 64, 16, 32.0, 64.0)
    }
    public static func staticMemberFunction(p: (Bool, Int, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, 
        Int, Int8, Int16, Int32, Int64, UInt16, Float32, Float64) {
        Logger.println("CangjieEnum.staticMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
        (true, 6, 8, 16, 32, 64, 16, 32.0, 64.0)
    }
}

public interface CangjieInterface {
    // func instanceMemberFunction(p: (Bool, Int, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, Int, Int8, Int16, 
    //     Int32, Int64, UInt16, Float32, Float64) {
    //     Logger.println("CangjieStruct.instanceMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
    //     Logger.println("p[0] = ${p[0]}, p[1] = ${p[1]}")
    //     (true, 6, 8, 16, 32, 64, 16, 32.0, 64.0)
    // }
    // static func staticMemberFunction(p: (Bool, Int, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, Int, Int8, 
    //     Int16, Int32, Int64, UInt16, Float32, Float64) {
    //     Logger.println("CangjieStruct.staticMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
    //     (true, 6, 8, 16, 32, 64, 16, 32.0, 64.0)
    // }
    // func instanceMemberFunction(p: (Bool, Int, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): Unit {
    //     // Logger.println("CangjieStruct.instanceMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
    //     // Logger.println("p[0] = ${p[0]}, p[1] = ${p[1]}")
    //     // (true, 6, 8, 16, 32, 64, 16, 32.0, 64.0)
    // }
    func instanceMemberFunctionWithoutDefaultImpl(p: (Bool, Int, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, 
        Int, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)
    static func staticMemberFunctionWithoutDefaultImpl(
        p: (Bool, Int, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, Int, Int8, Int16, Int32, Int64, 
        UInt16, Float32, Float64)
    // static func staticMemberFunction(p: (Bool, Int, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): Unit {
    //     Logger.println("CangjieStruct.staticMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
    //     (true, 6, 8, 16, 32, 64, 16, 32.0, 64.0)
    // }
}
