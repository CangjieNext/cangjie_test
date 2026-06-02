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
}

extend Int8 <: Integer<Int8> {}

extend Int16 <: Integer<Int16> {}

extend Int32 <: Integer<Int32> {}

extend Int64 <: Integer<Int64> {}

extend IntNative <: Integer<IntNative> {}

extend UInt8 <: Integer<UInt8> {}

extend UInt16 <: Integer<UInt16> {}

extend UInt32 <: Integer<UInt32> {}

extend UInt64 <: Integer<UInt64> {}

extend UIntNative <: Integer<UIntNative> {}

func foo<T>(x: T, y: T, n: Int64): T where T <: Integer<T> {
    if (n == 0) {
        return x + y
    } else if (n == 1) {
        return x - y
    } else if (n == 2) {
        return x * y
    } else if (n == 3) {
        return x / y
    } else if (n == 4) {
        return x % y
    } else {
        return -x
    }
}
