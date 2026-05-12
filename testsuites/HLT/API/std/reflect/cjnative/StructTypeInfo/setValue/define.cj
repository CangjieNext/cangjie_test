/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package define

import std.reflect.*

public struct S0 {
    public var v1: Int64 = 1
    public const init(a!: Int64 = 1) {
        this.v1 = a
    }

    public init(a: Int32) {
        this.v1 = Int64(a)
    }
}

public struct S1<T> {
    public var v1: Int64 = 1
    public const init(a!: Int64 = 1) {
        this.v1 = a
    }

    public init(a: T) {
    }
}

public class Test_C1 {
    public var struct_1 = S0()
    public static var struct_2 = S0(a: 10)
    public var struct_3 = S0(1)

    public let struct_4 = S0()
    public static const struct_5 = S0()

    public var struct_6 = ["a"]

    public var struct_7 = S1<UInt64>()
    public static var struct_8 = S1<String>("123456")
    public var struct_9 = S1<UInt64>(a: 10)

    public let struct_10 = S1<UInt64>()
    public static const struct_11 = "a"
}

public struct Test_S1 {
    public var struct_1 = S0()
    public static var struct_2 = S0(a: 10)
    public var struct_3 = S0(1i32)

    public let struct_4 = S0(a: 1)
    public static const struct_5 = S0()

    public var struct_6 = ["a"]

    public var struct_7 = S1<UInt64>()
    public static var struct_8 = S1<String>("123456")
    public var struct_9 = S1<UInt64>(a: 10)

    public let struct_10 = S1<UInt64>(1)
    public static const struct_11 = "b"
}

public var struct_1 = S0()
public var struct_2 = S0(a: 10)
public var struct_3 = S0(1)
public let struct_4 = S0()
public const struct_5 = S0()
public var struct_6 = ["a"]
public var struct_7 = S1<UInt64>()
public var struct_8 = S1<String>("123456")
public var struct_9 = S1<UInt64>(a: 10)
public let struct_10 = S1<UInt64>()
public const struct_11 = "a"
