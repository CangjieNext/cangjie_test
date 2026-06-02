/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package dependency

public interface Constructable<T> {
    static func construct(): T
}

extend Unit <: Constructable<Unit> {
    public static func construct(): Unit {
        ()
    }
}

extend Bool <: Constructable<Bool> {
    public static func construct(): Bool {
        true
    }
}

extend Int8 <: Constructable<Int8> {
    public static func construct(): Int8 {
        1i8
    }
}

extend Int16 <: Constructable<Int16> {
    public static func construct(): Int16 {
        1i16
    }
}

extend Int32 <: Constructable<Int32> {
    public static func construct(): Int32 {
        1i32
    }
}

extend Int64 <: Constructable<Int64> {
    public static func construct(): Int64 {
        123i64
    }
}

extend UInt8 <: Constructable<UInt8> {
    public static func construct(): UInt8 {
        1u8
    }
}

extend UInt16 <: Constructable<UInt16> {
    public static func construct(): UInt16 {
        1u16
    }
}

extend UInt32 <: Constructable<UInt32> {
    public static func construct(): UInt32 {
        1u32
    }
}

extend UInt64 <: Constructable<UInt64> {
    public static func construct(): UInt64 {
        123u64
    }
}

extend Float32 <: Constructable<Float32> {
    public static func construct(): Float32 {
        114.514000f32
    }
}

extend Float64 <: Constructable<Float64> {
    public static func construct(): Float64 {
        114.514000f64
    }
}
