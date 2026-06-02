// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

interface Integer<T> {
    operator func +(x: T): T
    operator func -(x: T): T
    operator func *(x: T): T
    operator func /(x: T): T
    operator func %(x: T): T
    operator func -(): T
    func toInt64(): Int64
}

extend Int8 <: Integer<Int8> {
    public func toInt64(): Int64 {
        Int64(this)
    }
}

extend Int16 <: Integer<Int16> {
    public func toInt64(): Int64 {
        Int64(this)
    }
}

extend Int32 <: Integer<Int32> {
    public func toInt64(): Int64 {
        Int64(this)
    }
}

extend Int64 <: Integer<Int64> {
    public func toInt64(): Int64 {
        Int64(this)
    }
}

extend IntNative <: Integer<IntNative> {
    public func toInt64(): Int64 {
        Int64(this)
    }
}

extend UInt8 <: Integer<UInt8> {
    public func toInt64(): Int64 {
        Int64(this)
    }
}

extend UInt16 <: Integer<UInt16> {
    public func toInt64(): Int64 {
        Int64(this)
    }
}

extend UInt32 <: Integer<UInt32> {
    public func toInt64(): Int64 {
        Int64(this)
    }
}

extend UInt64 <: Integer<UInt64> {
    public func toInt64(): Int64 {
        Int64(this)
    }
}

extend UIntNative <: Integer<UIntNative> {
    public func toInt64(): Int64 {
        Int64(this)
    }
}

func foo<T>(x: T, y: T, n: Int64): Int64 where T <: Integer<T> {
    try {
        let z = if (n == 0) {
            x + y
        } else if (n == 1) {
            x - y
        } else if (n == 2) {
            x * y
        } else if (n == 3) {
            x / y
        } else if (n == 4) {
            x % y
        } else {
            -x
        }
        return z.toInt64()
    } catch (e: OverflowException) {
        return 1
    }
}
