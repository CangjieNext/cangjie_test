// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test0

public abstract class LazyTensorHandle {
    public open func getType() {
        true
    }
}

public class ConcreteTensor <: LazyTensorHandle {
    public static func build<T>(value: Array<T>): ConcreteTensor {
        return ConcreteTensor()
    }
}

public struct Tensor {
    let handle: Option<LazyTensorHandle>
    public init(value: Float16) {
        handle = ConcreteTensor.build([Float16(value)])
    }
    public func getHandleOrThrow(): LazyTensorHandle {
        return handle.getOrThrow()
    }
}
