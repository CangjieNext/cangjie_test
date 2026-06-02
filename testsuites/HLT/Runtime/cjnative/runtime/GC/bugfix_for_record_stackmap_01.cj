/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 11

import std.runtime.*

struct Tensor {
    public var handle: LazyTensorHandle = LazyTensorHandle(0)
    public init(handle: LazyTensorHandle) {
        this.handle = handle
    }
}

class LazyTensorHandle {
    private var tensorHandle: Int64 = 0
    public init(inputHandle: Int64) {
        tensorHandle = inputHandle
    }
    ~init() {
        tensorHandle = 0
    }
    public func GetMSHandle():Int64 {
        return tensorHandle
    }
}

class Dataset {
    public var input: Array<Tensor> = Array<Tensor>()
    public func GetNext(params: Array<Tensor>):Unit {
        let size = params.size
        let handles: Array<Int64> = Array<Int64>(size, repeat: Int64(0))
        for (i in 0..size) {
            print("${params[i].handle.GetMSHandle()}")
        }
        return
    }
}

main(): Int64 {
    let a = Tensor(LazyTensorHandle(1))
    let b = Tensor(LazyTensorHandle(1))
    var ds = Dataset()
    GC()
    ds.GetNext([a, b])
    return 0
}
