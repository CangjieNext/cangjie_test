// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package A

public interface Number<T> {}

public interface Integer<T> <: Number<T> {}

public interface Float<T> <: Number<T> {}

public func sumInt<T>(a: Array<T>): T where T <: Integer<T> {
    return a[0]
}

public func sumFloat<T>(a: Array<T>): T where T <: Float<T> {
    return a[0]
}

public func sumNumeric<T>(a: Array<T>): T where T <: Float<T> & Integer<T> {
    return a[0]
}
