// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
package linear

public class Vector<T> where T <: CType {
    public init(ptr: CPointer<T>, size: Int64) {}
    public init(size: Int64) {}
}

public func example(a: Float64, b: Vector<Float64>): Vector<Float64> {
    let res = Vector<Float64>(12)
    return res
}
